CREATE SCHEMA IF NOT EXISTS Hotel_Alola;

--tabelas sem FK

-- Tabela de Clientes
CREATE TABLE hotel_alola.Cliente(
    id_cliente                  UUID              NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    nome_cliente                VARCHAR(100)      NOT NULL,
    data_nasc_cliente           DATE              NOT NULL,
    CPF_cliente                 VARCHAR(11)       NOT NULL UNIQUE,
    RG_cliente                  VARCHAR(20)       NOT NULL UNIQUE,
    logradouro_cliente          VARCHAR(200)      NOT NULL,
    complemento_cliente         VARCHAR(100)              ,
    numero_cliente              VARCHAR(20)       NOT NULL,
    bairro_cliente              VARCHAR(200)      NOT NULL,
    CEP_cliente                 VARCHAR(8)        NOT NULL,
    nacionalidade_cliente       VARCHAR(20)               
);

-- Tabela de Funcionarios
CREATE TABLE hotel_alola.Funcionarios(      
    id_funcionario              UUID              NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    nome_funcionario            VARCHAR(100)      NOT NULL,
    CPF_funcionario             VARCHAR(11)       NOT NULL UNIQUE,
    RG_funcionario              VARCHAR(20)       NOT NULL UNIQUE,
    data_admissao_funcionario   DATE              NOT NULL,
    data_nasc_funcionario       DATE              NOT NULL,
    telefone_funcionario        VARCHAR(50)       NOT NULL,
    email_funcionario           VARCHAR(50)       NOT NULL UNIQUE,
    cargo_funcionario           VARCHAR(100)      NOT NULL
);

-- Tabela de Pagamento
CREATE TABLE hotel_alola.Pagamento (
    id_pagamento                UUID              NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    valor_pago                  DECIMAL(10,2)     NOT NULL,
    tipo_pagamento              VARCHAR(50)       NOT NULL,
    status_pagamento            VARCHAR(20)       NOT NULL,
    data_pagamento              TIMESTAMP         NOT NULL
);

-- Tabela de Inventario
CREATE TABLE hotel_alola.Inventario(
    id_inventario               UUID              NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    estado_geral                VARCHAR(50)       NOT NULL,
    data_verificacao            DATE              NOT NULL,
    observacoes                 TEXT                      
);

-- Fim das tabelas sem FK


-- Tabelas com FK

-- Tabela Email
CREATE TABLE hotel_alola.Email (
    id_email                    UUID             NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    email_cliente               VARCHAR(50)      NOT NULL,
    id_cliente                  UUID             NOT NULL REFERENCES hotel_alola.Cliente(id_cliente) -- FK id_cliente
);

-- Tabela Telefone
CREATE TABLE hotel_alola.Telefone (
    id_telefone                 UUID             NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    telefone_cliente            VARCHAR(50)      NOT NULL,
    id_cliente                  UUID             NOT NULL REFERENCES hotel_alola.Cliente(id_cliente) -- FK id_cliente
);

-- Tabela Quartos
CREATE TABLE hotel_alola.Quartos (
    id_quarto                   UUID             NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    numero_quarto               INTEGER          NOT NULL,
    andar_quarto                INTEGER          NOT NULL,
    capacidade_quarto           INTEGER          NOT NULL,
    tipo_quarto                 VARCHAR(100)     NOT NULL,
    id_inventario               UUID             NOT NULL UNIQUE REFERENCES hotel_alola.Inventario(id_inventario) -- FK id_inventario
);

-- Tabela Reservas
CREATE TABLE hotel_alola.Reservas(
    id_reserva                  UUID             NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    valor_total                 DECIMAL(10,2)    NOT NULL,
    data_saida                  TIMESTAMP        NOT NULL,
    data_entrada                TIMESTAMP        NOT NULL,
    data_reserva                TIMESTAMP        NOT NULL,
    status_reserva              VARCHAR(20)      NOT NULL,
    qtd_hospedes                INTEGER          NOT NULL,
    id_cliente                  UUID             NOT NULL REFERENCES hotel_alola.Cliente(id_cliente), -- FK id_cliente
    id_pagamento                UUID             NOT NULL REFERENCES hotel_alola.Pagamento(id_pagamento) -- FK id_pagamento
);

-- Tabela Reserva_Quartos
CREATE TABLE hotel_alola.Reserva_Quartos(
    id_reserva_quarto           UUID              NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    id_reserva                  UUID              NOT NULL REFERENCES hotel_alola.Reservas(id_reserva), -- FK id_reserva
    id_quarto                   UUID              NOT NULL REFERENCES hotel_alola.Quartos(id_quarto) -- FK id_quarto
);

-- Tabela Reserva_Funcionarios
CREATE TABLE hotel_alola.Reserva_Funcionarios (
    id_reserva_funcionarios     UUID             NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
    id_funcionario              UUID             NOT NULL REFERENCES  hotel_alola.Funcionarios(id_funcionario), -- FK id_funcionario
    id_reserva                  UUID             NOT NULL REFERENCES  hotel_alola.Reservas(id_reserva) --FK id_reserva
);

-- Fim das tabelas com FK