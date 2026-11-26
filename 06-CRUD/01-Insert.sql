INSERT INTO hotel_alola.Cliente (
    nome_cliente, data_nasc_cliente, CPF_cliente, RG_cliente, logradouro_cliente,
    complemento_cliente, numero_cliente, bairro_cliente, CEP_cliente, nacionalidade_cliente
)
VALUES (
    'Ash Ketchum', '2005-05-22', '26797645686', '151095425', 'Rota 1', NULL, '1', 'Pallet', '14870000', 'Kanto'
)
RETURNING *;

INSERT INTO hotel_alola.Cliente (
    nome_cliente, data_nasc_cliente, CPF_cliente, RG_cliente, logradouro_cliente, 
    complemento_cliente, numero_cliente, bairro_cliente, CEP_cliente, nacionalidade_cliente
)
VALUES
(
    'Gabriel Henrique Oliveira', '2002-04-18', '45367890876', '378396286', 'Rua das Acacias', 'Apartamento 67', '245', 'Generoso', '14870000', 'Brasileiro'
),
(
    'Mariana Costa Ferreira', '1998-09-25', '35678654345', '447629098', 'Avenida Brasil', NULL, '780', 'Guarani',  '14870120', 'Brasileira'
)
RETURNING *;
