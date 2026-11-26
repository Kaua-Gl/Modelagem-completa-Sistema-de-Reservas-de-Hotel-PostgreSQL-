SELECT c.nome_cliente AS cliente, q.numero_quarto, q.tipo_quarto, r.data_entrada, r.data_saida, r.status_reserva
FROM hotel_alola.Reserva_Quartos rq
JOIN hotel_alola.Quartos q ON q.id_quarto = rq.id_quarto
JOIN hotel_alola.Reservas r ON r.id_reserva = rq.id_reserva
JOIN hotel_alola.Cliente c ON c.id_cliente = r.id_cliente
WHERE r.data_saida > r.data_entrada
ORDER BY r.data_entrada DESC, q.numero_quarto

LIMIT 50;
