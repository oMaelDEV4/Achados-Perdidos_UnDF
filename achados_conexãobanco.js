const mysql = require('mysql2');

const db = mysql.createPool({
    host: "localhost",
    user: "seu_usuario",
    password: "sua_senha",
    database: "seu_banco",
    port: 3306
});

db.getConnection((err, connection) => {
    if (err) {
        console.error("Erro ao conectar ao MySQL:", err);
    } else {
        console.log("Conectado ao MySQL!");
        connection.release();
    }
});

module.exports = db;

app.post("/api/encontrado", (req, res) => {
    const { descricao, nome, matricula, horario, local } = req.body;

    const sql = `
        INSERT INTO itens_encontrados 
        (descricao, nome, matricula, horario, local_encontrado)
        VALUES (?, ?, ?, ?, ?)
    `;

    db.query(sql, [descricao, nome, matricula, horario, local], (err) => {
        if (err) return res.status(500).json({ erro: err });
        res.json({ sucesso: true });
    });
});

app.get("/api/pesquisa", (req, res) => {
    const pesquisa = `%${req.query.q}%`;

    const sql = `
        SELECT * FROM itens_encontrados
        WHERE descricao LIKE ?
           OR local_encontrado LIKE ?
           OR nome LIKE ?
    `;

    db.query(sql, [pesquisa, pesquisa, pesquisa], (err, resultados) => {
        if (err) return res.status(500).json({ erro: err });
        res.json(resultados);
    });
});

app.post("/api/resgate", (req, res) => {
    const { item_id, matricula } = req.body;

    const sql = `
        INSERT INTO solicitacoes_resgate 
        (item_id, matricula_solicitante, horario_pedido)
        VALUES (?, ?, NOW())
    `;

    db.query(sql, [item_id, matricula], (err) => {
        if (err) return res.status(500).json({ erro: err });
        res.json({ sucesso: true });
    });
});
