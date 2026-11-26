UPDATE hotel_alola.Cliente
SET
    logradouro_cliente = 'santo santo',
    numero_cliente = '250',
    bairro_cliente = 'Jardim Paulista'
WHERE CPF_cliente = '45367890876'
RETURNING *;