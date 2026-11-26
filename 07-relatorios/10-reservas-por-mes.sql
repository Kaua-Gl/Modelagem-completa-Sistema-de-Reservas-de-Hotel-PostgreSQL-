SELECT DATE_TRUNC('month', r.data_reserva)::DATE AS mes, COUNT(*) AS quantidade_reservas, SUM(r.valor_total) AS valor_total_reservado, SUM(r.qtd_hospedes) AS total_hospedes_previstos
FROM hotel_alola.Reservas r
WHERE r.data_reserva >= '2025-01-01'
GROUP BY DATE_TRUNC('month', r.data_reserva)
ORDER BY mes;
