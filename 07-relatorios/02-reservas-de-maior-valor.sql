SELECT c.nome_cliente AS cliente, r.valor_total, r.qtd_hospedes, r.data_entrada, r.data_saida
FROM hotel_alola.Reservas r
JOIN hotel_alola.Cliente c ON c.id_cliente = r.id_cliente
WHERE r.valor_total > 0
ORDER BY r.valor_total DESC, r.data_entrada

LIMIT 20;
