SELECT q.numero_quarto, q.andar_quarto, q.tipo_quarto, q.capacidade_quarto, i.estado_geral, i.data_verificacao
FROM hotel_alola.Quartos q
JOIN hotel_alola.Inventario i ON i.id_inventario = q.id_inventario
WHERE q.capacidade_quarto >= 3
ORDER BY q.capacidade_quarto DESC, q.numero_quarto

LIMIT 50;
