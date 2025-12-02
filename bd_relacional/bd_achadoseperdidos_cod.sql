CREATE DATABASE IF NOT EXISTS achados_perdidos;
USE achados_perdidos;

CREATE TABLE Objetos_Perdidos (
    Eletronicos INT,
    Roupas VARCHAR(45),
    Documentos VARCHAR(45),
    Outros VARCHAR(45)
);

CREATE TABLE Registrar_Item_Perdido (
    nome INT PRIMARY KEY,
    matricula VARCHAR(45),
    descricao VARCHAR(45),
    local_encontrado VARCHAR(45),
    horario VARCHAR(45)
);

CREATE TABLE Itens_Perdidos (
    id_solicite_resgate INT PRIMARY KEY,
    iphone_13_branco VARCHAR(45),
    notebook_samsung_4gb VARCHAR(45),
    camiseta_preta VARCHAR(45),
    garrafa_de_agua VARCHAR(45),
    identidade VARCHAR(45),
    Registrar_Item_Perdido_nome INT,

    FOREIGN KEY (Registrar_Item_Perdido_nome) 
        REFERENCES Registrar_Item_Perdido(nome)
);

CREATE TABLE lupa_de_pesquisa (
    id_digitsseuobjeto INT PRIMARY KEY,
    Itens_Perdidos_id_solicite_resgate INT,

    FOREIGN KEY (Itens_Perdidos_id_solicite_resgate)
        REFERENCES Itens_Perdidos(id_solicite_resgate)
);

CREATE TABLE Itens_Devolvidos (
    id_objetodevolvido INT PRIMARY KEY,
    iphone_13_branco VARCHAR(45),
    lupa_de_pesquisa_id_digitsseuobjeto INT,

    FOREIGN KEY (lupa_de_pesquisa_id_digitsseuobjeto)
        REFERENCES lupa_de_pesquisa(id_digitsseuobjeto)
);