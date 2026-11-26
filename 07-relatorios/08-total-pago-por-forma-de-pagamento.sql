SELECT p.tipo_pagamento, COUNT(*) AS quantidade_pagamentos, SUM(p.valor_pago) AS total_recebido, ROUND(AVG(p.valor_pago),2) AS valor_medio
FROM hotel_alola.Pagamento p
WHERE p.status_pagamento = 'Pago'
GROUP BY p.tipo_pagamento
ORDER BY total_recebido DESC, p.tipo_pagamento;
