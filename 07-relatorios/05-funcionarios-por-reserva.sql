SELECT f.nome_funcionario, f.cargo_funcionario, r.data_reserva, r.data_entrada, r.status_reserva
FROM hotel_alola.Reserva_Funcionarios rf
JOIN hotel_alola.Funcionarios f ON f.id_funcionario = rf.id_funcionario
JOIN hotel_alola.Reservas r ON r.id_reserva = rf.id_reserva
WHERE r.valor_total > 0
ORDER BY r.data_reserva DESC, f.nome_funcionario

LIMIT 50;
