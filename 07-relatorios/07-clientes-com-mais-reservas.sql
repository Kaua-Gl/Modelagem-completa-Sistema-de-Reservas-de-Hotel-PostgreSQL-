SELECT c.nome_cliente AS cliente, COUNT(r.id_reserva) AS quantidade_reservas, SUM(r.valor_total) AS valor_total_reservado
FROM hotel_alola.Cliente c
JOIN hotel_alola.Reservas r ON r.id_cliente = c.id_cliente
WHERE r.valor_total > 0
GROUP BY c.id_cliente, c.nome_cliente
ORDER BY quantidade_reservas DESC, valor_total_reservado DESC, cliente

LIMIT 20;
