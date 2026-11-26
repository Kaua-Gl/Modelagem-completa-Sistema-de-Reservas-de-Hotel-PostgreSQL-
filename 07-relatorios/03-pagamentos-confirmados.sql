SELECT c.nome_cliente AS cliente, p.tipo_pagamento, p.valor_pago, p.data_pagamento, p.status_pagamento, r.status_reserva
FROM hotel_alola.Pagamento p
JOIN hotel_alola.Reservas r ON r.id_pagamento = p.id_pagamento
JOIN hotel_alola.Cliente c ON c.id_cliente = r.id_cliente
WHERE p.status_pagamento = 'Pago'
ORDER BY p.data_pagamento DESC

LIMIT 50;
