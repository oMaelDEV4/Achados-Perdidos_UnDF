SELECT 'Conectado ao MySQL com sucesso!' AS status;

INSERT INTO itens_encontrados (descricao, nome, matricula, horario, local_encontrado)
VALUES ('{descricao}', '{nome}', '{matricula}', '{horario}', '{local}');

SELECT * FROM itens_encontrados
WHERE descricao LIKE CONCAT('%', '{pesquisa}', '%')
   OR local_encontrado LIKE CONCAT('%', '{pesquisa}', '%')
   OR nome LIKE CONCAT('%', '{pesquisa}', '%');

INSERT INTO solicitacoes_resgate (item_id, matricula_solicitante, horario_pedido)
VALUES ({item_id}, '{matricula}', NOW());
