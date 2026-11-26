# Modelagem de Banco de Dados — Hotel Alola

Projeto acadêmico desenvolvido para a disciplina de **Modelagem de Banco de Dados**, com modelagem conceitual, lógica e física de um sistema de reservas hoteleiras. A implementação do banco de dados será realizada em **PostgreSQL**, utilizando a plataforma **Supabase**.

## 1. Cenário

### 1.1. Descrição do estabelecimento

O **Hotel Alola** é um estabelecimento hoteleiro fictício que oferece serviços de hospedagem para clientes que buscam acomodações para viagens de lazer, trabalho ou outras necessidades.

O hotel dispõe de diferentes categorias de quartos, com características e capacidades variadas, permitindo que os clientes realizem reservas de uma ou mais unidades, conforme suas necessidades.

Para realizar suas atividades, o estabelecimento conta com funcionários responsáveis pelo atendimento aos clientes, registro das reservas e acompanhamento das operações internas.

Além do gerenciamento das hospedagens, o hotel mantém informações sobre seus quartos e respectivos inventários, com o objetivo de acompanhar as condições das acomodações e organizar os recursos disponíveis.

### 1.2. Problema identificado

O Hotel Alola enfrenta dificuldades para organizar e consultar as informações relacionadas às suas atividades devido à ausência de um banco de dados centralizado.

O controle descentralizado dos registros pode ocasionar duplicidade de informações, inconsistências nos cadastros de clientes, dificuldades para identificar os quartos associados a cada reserva e falta de organização dos pagamentos.

Além disso, o gerenciamento das informações dos funcionários e dos inventários dos quartos torna-se mais trabalhoso quando os dados não estão devidamente relacionados.

Outro desafio é acompanhar o histórico de reservas, principalmente porque um mesmo cliente pode realizar diferentes reservas e um quarto pode ser reservado em períodos distintos.

Diante dessas necessidades, o estabelecimento busca uma solução que organize suas informações de maneira estruturada, garantindo maior integridade, consistência e facilidade de consulta.

### 1.3. Solução proposta

Propõe-se a criação de um **banco de dados relacional para o Hotel Alola**, desenvolvido em PostgreSQL por meio do Supabase.

O banco de dados centralizará e relacionará informações de clientes, funcionários, quartos, inventários, reservas e pagamentos. Sua estrutura dará suporte ao cadastro, consulta, atualização e exclusão de registros, além da elaboração de relatórios por meio de consultas SQL.

A modelagem também contempla situações em que uma reserva envolve vários quartos e em que diferentes funcionários participam do registro de uma mesma reserva.

### 1.4. Entidades e atributos

O modelo conceitual possui **seis entidades principais**. No modelo lógico, também são utilizadas tabelas auxiliares para representar atributos multivalorados e relacionamentos muitos para muitos.

| Entidade | Finalidade | Atributos identificados |
|---|---|---|
| **Cliente** | Dados dos clientes responsáveis por reservas | `id_cliente`, nome, CPF, RG, `data_nasc`, idade (derivada), nacionalidade, endereço (composto), telefone (multivalorado), e-mail (multivalorado) |
| **Funcionários** | Dados dos profissionais do hotel | `id_funcionario`, nome, CPF, RG, `data_nasc`, idade (derivada), telefone, e-mail, cargo, `data_admissao` |
| **Quartos** | Identificação e características das acomodações | `id_quarto`, número, andar, capacidade, `tipo_quarto` |
| **Inventário** | Registro das condições de cada quarto | `id_inventario`, `data_verificacao`, `estado_geral`, observações |
| **Reservas** | Dados e situação das hospedagens reservadas | `id_reserva`, `data_reserva`, `data_entrada`, `data_saida`, `qtd_hospedes`, `valor_total`, `status_reserva` |
| **Pagamento** | Informações de pagamento das reservas | `id_pagamento`, `valor_pago`, `data_pagamento`, `tipo_pagamento`, `status_pagamento` |

**Tipos de atributos presentes:**

- **Simples:** nome, CPF, RG, cargo, capacidade, entre outros.
- **Composto:** endereço de Cliente, decomposto em logradouro, número, bairro, CEP e complemento.
- **Multivalorados:** telefone e e-mail de Cliente.
- **Derivados:** idade de Cliente e de Funcionários, calculada a partir de `data_nasc`.
- **Identificadores (chaves):** os campos `id_...` de cada entidade.

### 1.5. Regras de negócio e relacionamentos

| Relacionamento | Tipo | Regra definida para o Hotel Alola |
|---|---|---|
| Cliente — Reservas | **1:N** | Um cliente realiza uma ou mais reservas; cada reserva pertence a um cliente. |
| Funcionários — Reservas | **N:N** | Um funcionário pode registrar zero ou mais reservas; uma reserva é registrada por um ou mais funcionários. |
| Reservas — Quartos | **N:N** | Uma reserva inclui um ou mais quartos; um quarto pode aparecer em várias reservas ao longo do tempo. |
| Pagamento — Reservas | **1:N** | Uma reserva possui um pagamento; um pagamento pode abranger uma ou mais reservas. |
| Quartos — Inventário | **1:1** | Cada quarto possui um inventário exclusivo e cada inventário está associado a um único quarto. |

Um mesmo quarto não deverá ter reservas confirmadas com períodos de hospedagem sobrepostos. Essa regra depende de validação específica na implementação, além dos relacionamentos e chaves estrangeiras.

Na modelagem lógica, os relacionamentos N:N são representados por `Reservas_Quartos` e `Reservas_Funcionarios`. Os atributos multivalorados de Cliente dão origem às tabelas `telefone` e `E-mail`.

### 1.6. Objetivo do projeto

Desenvolver um banco de dados relacional para o Hotel Alola, capaz de armazenar e relacionar informações necessárias ao gerenciamento de reservas e atividades administrativas. O projeto aplica identificação de entidades, atributos, chaves e relacionamentos, transformação dos modelos conceitual e lógico em uma estrutura física PostgreSQL, operações CRUD e consultas SQL.

## 2. Modelagem Conceitual

O Diagrama Entidade-Relacionamento (DER) apresenta as entidades, os atributos e os relacionamentos do cenário, incluindo exemplos de atributos simples, compostos, multivalorados, derivados e identificadores, bem como cardinalidades 1:1, 1:N e N:N.

**Arquivo:** [`02-Modelagem-conceitual/Modelo_Conceitual.png`](02-Modelagem-conceitual/Modelagem_conceitual_sistema_reserva_hotel.png)

![Modelo conceitual do Hotel Alola](02-Modelagem-conceitual/Modelagem_conceitual_sistema_reserva_hotel.svg)

## 3. Modelagem Lógica

O modelo lógico transforma as entidades e os relacionamentos em tabelas relacionais, identificando **chaves primárias (PK)**, **chaves estrangeiras (FK)** e os tipos de dados previstos. As tabelas associativas representam os relacionamentos N:N.

**Arquivo:** [`03-modelagem-logica/Modelo_Logico.png`](03-modelagem-logica/Modelagem_logica_sistema_reserva_hotel.drawio.png)

![Modelo lógico do Hotel Alola](03-modelagem-logica/Modelagem_logica_sistema_reserva_hotel.drawio.svg)

## 4. Modelagem Física

A implementação foi realizada em PostgreSQL, no Supabase, com os comandos de criação das tabelas, definição de tipos de dados, chaves, relacionamentos e restrições de integridade referencial.

**Arquivos desta etapa:**

- [`04-modelagem-fisica/01-criacao-tabelas.sql`](04-modelagem-fisica/01-criacao-tabelas.sql) — script de criação do banco.
- `04-modelagem-fisica/Prints/` — capturas da estrutura das tabelas e relacionamentos no Supabase.

## 5. Dados

Nesta etapa, foram inseridos **5.400 registros fictícios**, distribuídos entre as 10 tabelas do banco de dados do Hotel Alola, respeitando os relacionamentos e as chaves estrangeiras.

Para facilitar a organização e a manutenção, os comandos de inserção foram separados em arquivos SQL individuais, um para cada tabela.

### Arquivos desta etapa

**Scripts de inserção:**

- [01.1 — Clientes](05-dados/01-insercao-cliente.sql)
- [01.2 — Funcionários](05-dados/01.2-insercao-funcionarios.sql)
- [01.3 — Pagamentos](05-dados/01.3-insercao-pagamento.sql)
- [01.4 — Inventário](05-dados/01.4-insercao-inventario.sql)
- [01.5 — E-mails](05-dados/01.5-insercao-email.sql)
- [01.6 — Telefones](05-dados/01.6-insercao-telefone.sql)
- [01.7 — Quartos](05-dados/01.7-insercao-quartos.sql)
- [01.8 — Reservas](05-dados/01.8-insercao-reservas.sql)
- [01.9 — Reserva_Quartos](05-dados/01.9-insercao-reserva_quartos.sql)
- [01.10 — Reserva_Funcionarios](05-dados/01.10-insercao-reserva_funcionarios.sql)

**Verificação dos registros:**

- [02 — Verificação dos registros](05-dados/02-verificacao-registros.sql) — consultas SQL para conferir a quantidade de registros inseridos em cada tabela.

### Evidências no Supabase

A pasta [`05-dados/Prints/`](05-dados/Prints/) contém as capturas de tela das tabelas preenchidas e dos resultados da execução.

- [01 — Clientes](05-dados/Prints/01-clientes.png)
- [02 — Funcionários](05-dados/Prints/02-funcionarios.png)
- [03 — Pagamentos](05-dados/Prints/03-pagamentos.png)
- [04 — Inventários](05-dados/Prints/04-inventarios.png)
- [05 — E-mails](05-dados/Prints/05-E-mails.png)
- [06 — Telefones](05-dados/Prints/06-telefones.png)
- [07 — Quartos](05-dados/Prints/07-quartos.png)
- [08 — Reservas](05-dados/Prints/08-reservas.png)
- [09 — Reserva_Quartos](05-dados/Prints/09-reserva-quartos.png)
- [10 — Reserva_Funcionarios](05-dados/Prints/10-reserva-funcionarios.png)
- [11 — Contagem de registros](05-dados/Prints/11-contagem-registros.png)

Também foi adicionada uma captura da execução dos scripts de inserção no Supabase.

## 6. CRUD

Nesta etapa, foram implementadas e executadas as quatro operações fundamentais de manipulação de dados em um banco de dados relacional: **Create, Read, Update e Delete (CRUD)**.

As operações foram desenvolvidas utilizando comandos SQL no PostgreSQL, por meio do SQL Editor do Supabase, com foco na tabela `Cliente` do Hotel Alola.

| Operação | Comando SQL | Implementação |
|---|---|---|
| Create | `INSERT` | Cadastro de novos clientes |
| Read | `SELECT` | Consulta de clientes por CPF e nome |
| Update | `UPDATE` | Atualização das informações de endereço de um cliente |
| Delete | `DELETE` | Exclusão de um cliente e verificação posterior |

### 6.1. Scripts SQL

Para facilitar a organização, cada operação foi armazenada em um arquivo SQL independente numerado em ordem de execução.

- [01 — INSERT (Create)](06-CRUD/01-Insert.sql) — inserção de três clientes fictícios no banco de dados.
- [02 — SELECT (Read)](06-CRUD/02-select.sql) — consultas utilizando CPF e nome dos clientes.
- [03 — UPDATE (Update)](06-CRUD/03-Update.sql) — atualização dos dados de endereço de um cliente específico.
- [04 — DELETE (Delete)](06-CRUD/04-Delete.sql) — exclusão de um cliente e consulta para verificar a remoção do registro.

Os comandos utilizam cláusulas como `WHERE` para selecionar registros específicos e `RETURNING *` para exibir os registros inseridos, alterados ou excluídos.

### 6.2. Evidências de execução

As operações foram demonstradas no Supabase, com capturas de tela dos comandos e seus resultados.

- [01 — Execução do INSERT](06-CRUD/Prints/01-Insert%20%28Create%29.png)
- [02 — Execução do SELECT](06-CRUD/Prints/02-Select%20%28Read%29.png)
- [03 — Execução do UPDATE](06-CRUD/Prints/03-Update%20%28Update%29.png)
- [04 — Execução do DELETE](06-CRUD/Prints/04-%20Delete%20%28Delete%29.png)
- [05 — Verificação do DELETE](06-CRUD/Prints/05-%20Verificar%20Delete%20%28delete%29.png)

Todas as evidências estão organizadas na pasta [`06-CRUD/Prints/`](06-CRUD/Prints/).

## 7. Relatórios

**Arquivos desta etapa:**

- [`07-relatorios/relatorios.sql`](07-relatorios/relatorios.sql) — as 10 consultas comentadas e organizadas.
- `07-relatorios/Prints/` — capturas dos resultados, como evidências complementares.

---

## Organização dos arquivos

```text
Modelagem-Banco-de-Dados-Hotel-Alola/
├── README.md
│
├── 02-Modelagem-conceitual/
│   ├── Modelagem_conceitual_sistema_reserva_hotel.png
│   └── Modelagem_conceitual_sistema_reserva_hotel.svg
│
├── 03-modelagem-logica/
│   ├── Modelagem_logica_sistema_reserva_hotel.drawio.png
│   └── Modelagem_logica_sistema_reserva_hotel.drawio.svg
│
├── 04-modelagem-fisica/
│   ├── 01-criacao-tabelas.sql
│   └── Prints/
│       ├── 01-execucao-sql.png
│       ├── 02-tabelas-criadas.png
│       ├── 03-estrutura-tabelas.png
│       └── 04-relacionamentos.png
│
├── 05-dados/
│   ├── 01-insercao-cliente.sql
│   ├── 01.2-insercao-funcionarios.sql
│   ├── 01.3-insercao-pagamento.sql
│   ├── 01.4-insercao-inventario.sql
│   ├── 01.5-insercao-email.sql
│   ├── 01.6-insercao-telefone.sql
│   ├── 01.7-insercao-quartos.sql
│   ├── 01.8-insercao-reservas.sql
│   ├── 01.9-insercao-reserva_quartos.sql
│   ├── 01.10-insercao-reserva_funcionarios.sql
│   ├── 02-verificacao-registros.sql
│   └── Prints/
│       ├── 01-clientes.png
│       ├── 02-funcionarios.png
│       ├── 03-pagamentos.png
│       ├── 04-inventarios.png
│       ├── 05-E-mails.png
│       ├── 06-telefones.png
│       ├── 07-quartos.png
│       ├── 08-reservas.png
│       ├── 09-reserva-quartos.png
│       ├── 10-reserva-funcionarios.png
│       ├── 11-contagem-registros.png
│       └── 12-Execução-dos-dados-supabase.png
│
└── 06-CRUD/
    ├── 01-Insert.sql
    ├── 02-select.sql
    ├── 03-Update.sql
    ├── 04-Delete.sql
    └── Prints/
        ├── 01-Insert (Create).png
        ├── 02-Select (Read).png
        ├── 03-Update (Update).png
        ├── 04- Delete (Delete).png
        └── 05- Verificar Delete (delete).png
```
