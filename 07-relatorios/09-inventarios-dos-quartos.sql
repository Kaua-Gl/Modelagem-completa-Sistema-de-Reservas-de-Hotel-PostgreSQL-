SELECT q.numero_quarto, q.tipo_quarto, i.estado_geral, i.data_verificacao, i.observacoes
FROM hotel_alola.Inventario i
JOIN hotel_alola.Quartos q ON q.id_inventario = i.id_inventario
WHERE i.data_verificacao IS NOT NULL
ORDER BY i.data_verificacao DESC, q.numero_quarto

LIMIT 50;
