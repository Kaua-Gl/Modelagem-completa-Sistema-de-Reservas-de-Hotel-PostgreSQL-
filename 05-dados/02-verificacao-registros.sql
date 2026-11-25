-- verificar a quantidade de registros

SELECT 'Cliente' AS tabela,                 COUNT(*)        AS quantidade FROM hotel_alola.Cliente
UNION ALL SELECT 'Funcionarios',            COUNT(*)        FROM hotel_alola.Funcionarios
UNION ALL SELECT 'Pagamento',               COUNT(*)        FROM hotel_alola.Pagamento
UNION ALL SELECT 'Inventario',              COUNT(*)        FROM hotel_alola.Inventario
UNION ALL SELECT 'Email',                   COUNT(*)        FROM hotel_alola.Email
UNION ALL SELECT 'Telefone',                COUNT(*)        FROM hotel_alola.Telefone
UNION ALL SELECT 'Quartos',                 COUNT(*)        FROM hotel_alola.Quartos
UNION ALL SELECT 'Reservas',                COUNT(*)        FROM hotel_alola.Reservas
UNION ALL SELECT 'Reserva_Quartos',         COUNT(*)        FROM hotel_alola.Reserva_Quartos
UNION ALL SELECT 'Reserva_Funcionarios',    COUNT(*)        FROM hotel_alola.Reserva_Funcionarios

ORDER BY tabela;
