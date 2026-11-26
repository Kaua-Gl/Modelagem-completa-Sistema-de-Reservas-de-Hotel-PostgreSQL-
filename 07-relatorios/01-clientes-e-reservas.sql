SELECT c.nome_cliente AS cliente, r.data_entrada, r.data_saida, r.qtd_hospedes, r.valor_total, r.status_reserva
FROM hotel_alola.Reservas r
JOIN hotel_alola.Cliente c ON c.id_cliente = r.id_cliente
WHERE r.valor_total > 0
ORDER BY r.data_entrada DESC, c.nome_cliente

LIMIT 50;
