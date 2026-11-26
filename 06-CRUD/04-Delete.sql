DELETE FROM hotel_alola.Cliente
WHERE CPF_cliente = '35678654345'
RETURNING *;

SELECT *
FROM hotel_alola.Cliente
WHERE CPF_cliente = '35678654345';