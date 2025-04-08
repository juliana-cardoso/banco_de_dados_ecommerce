-- persistindo dados no banco de dados ecommerce;
use ecommerce;

-- inserindo dados na tabela clients: (Fname, Minit, Lname, Address, Email, CellPhone, typeClient)
INSERT INTO clients (Fname, Minit, Lname, Address, Email, CellPhone, typeClient) VALUES
		('Carlos', 'A', 'Silva', 'Rua das Flores, 123, São Paulo - SP', 'carlos.silva@example.com', '(11) 91234-5678', 'PF'),
-- INSERT INTO clients (Fname, Minit, Lname, Address, Email, CellPhone, typeClient) VALUES
		('Ana', 'B', 'Oliveira', 'Avenida Brasil, 456, Rio de Janeiro - RJ', 'ana.oliveira@example.com', '(21) 99876-5432', 'PF'),
		('João', 'C', 'Santos', 'Rua do Comercio, 789, Belo Horizonte - MG', 'joao.santos@example.com', '(31) 98765-4321', 'PF'),
		('Maria', 'D', 'Pereira', 'Travessa das Palmeiras, 101, Curitiba - PR', 'maria.pereira@example.com', '(41) 99876-1234', 'PF'),
		('Roberto', 'E', 'Lima', 'Rua da Paz, 202, Fortaleza - CE', 'roberto.lima@example.com', '(85) 93456-7890', 'PJ'),
		('Fernanda', 'F', 'Costa', 'Avenida São João, 303, Salvador - BA', 'fernanda.costa@example.com', '(71) 91234-9876', 'PF'),
		('Juliana', 'G', 'Almeida', 'Rua São José, 404, Porto Alegre - RS', 'juliana.almeida@example.com', '(51) 93456-1234', 'PJ'),
		('Felipe', 'H', 'Souza', 'Rua dos Mares, 505, Recife - PE', 'felipe.souza@example.com', '(81) 93567-4321', 'PF'),
		('Larissa', 'I', 'Mendes', 'Praça da República, 606, Manaus - AM', 'larissa.mendes@example.com', '(92) 91123-6543', 'PF'),
		('Jaime', 'W', 'Luang', 'Avenida das Indústrias, 100, São Paulo - SP', 'contato@techsolutions.com.br', '(11) 12345-6789', 'PJ');

truncate table clients;
delete from clients;
select * from clients;
desc clients;
alter table clients auto_increment=1;
SHOW VARIABLES LIKE 'auto_increment_increment';
SET GLOBAL auto_increment_increment = 1;
SET @old_auto_increment_increment := @@auto_increment_increment;  -- Salva o valor atual
   SET @@auto_increment_increment = 1;  -- Ajusta para 1

-- inserindo dados na tabela clients_pf (idClient, CPF, birthDate):
INSERT INTO clients_pf VALUES
		(1, '12345678901', '1985-04-15'),
		(2, '98765432100', '1992-08-23'),
		(3, '45678912345', '1980-12-30'),
		(4, '32165498732', '1995-06-10'),
		(6, '15975346822', '1990-07-19'),
		(8, '74125896304', '1998-09-10'),
		(9, '36925814758', '1989-05-12');
select * from clients_pf;

-- inserindo dados na tabela clients_pj (idClient, CNPJ, companyName, tradeName):
INSERT INTO clients_pj (idClient, CNPJ, companyName, tradeName) VALUES
		(5, '12345678000195', 'Tech Solutions Ltda.', 'Tech Solutions'),
		(7, '98765432000170', 'Green Energy S.A.', 'Green Power'),
		(10, '11223344000110', 'Foodies Delivery Inc.', 'Foodies Express');
select * from clients_pj;

-- inserindo dados na tabela product (idProduct, Pname, classification_kids, category, feedback, size)		
alter table product auto_increment=1;
insert into product (Pname, classification_kids, category, feedback, size) VALUES
		('Smartphone XYZ', 0, 'Eletrônico', 4.5, 'Médio'),
		('Camiseta Estampada', 1, 'Vestuário', 4.0, 'M'),
		('Bola de Futebol', 1, 'Brinquedos', 4.8, 'P'),
		('Chocolate ao Leite', 0, 'Alimentos', 4.9, '100g'),
		('Sofá Retrátil', 0, 'Móveis', 4.3, 'Grande'),
		('Notebook Pro 15', 0, 'Eletrônico', 4.7, '15poleg'),
		('Calça Jeans', 0, 'Vestuário', 3.9, '40'),
		('Carrinho de Controle Remoto', 1, 'Brinquedos', 4.6, 'P'),
		('Suco Natural de Laranja', 0, 'Alimentos', 5.0, '500ml'),
		('Mesa de Jantar', 0, 'Móveis', 4.2, 'M');
select * from product;

-- inserindo dados tabela orders (idOrder, idOrderClient, orderStatus	enum('Cancelado','Confirmado','Em processamento'), orderDescription, dateOrder, shippingCost, totalValue)
alter table orders auto_increment 1;
insert into orders (idOrder, idOrderClient, orderStatus, orderDescription, dateOrder, shippingCost, totalValue) values
		(1, 1, 'Confirmado', 'Compra de Smartphone XYZ', '2025-04-02', 20.00, 1500.00),
		(2, 2, 'Em processamento', 'Compra de Camiseta Estampada e Calça Jeans', '2025-04-02', 15.00, 250.00),
		(3, 3, 'Cancelado', 'Compra de Bola de Futebol', '2025-04-02', 10.00, 50.00),
		(4, 4, 'Confirmado', 'Compra de Sofá Retrátil e Mesa de Jantar', '2025-04-02', 80.00, 3500.00),
		(5, 5, 'Em processamento', 'Compra de Notebook Pro 15', '2025-04-02', 25.00, 4500.00),
		(6, 6, 'Confirmado', 'Compra de Suco Natural de Laranja e Chocolate ao Leite', '2025-04-02', 5.00, 40.00),
		(7, 7, 'Em processamento', 'Compra de Carrinho de Controle Remoto', '2025-04-02', 15.00, 120.00),
		(8, 8, 'Confirmado', 'Compra de Notebook Pro 15 e Camiseta Estampada', '2025-04-02', 30.00, 1700.00),
		(9, 9, 'Cancelado', 'Compra de Calça Jeans e Camiseta Estampada', '2025-04-02', 12.00, 150.00),
		(10, 10, 'Confirmado', 'Compra de Sofá Retrátil', '2025-04-02', 70.00, 2500.00);
insert into orders (idOrder, idOrderClient, orderStatus, orderDescription, dateOrder, shippingCost, totalValue) values
		(11, 1, 'Confirmado', 'Compra de notebook', '2025-04-01', 15.50, 1500.00),
		(12, 2, 'Em processamento', 'Compra de smartphone', '2025-04-02', 10.00, 1200.00),
		(13, 3, 'Confirmado', 'Compra de camisa polo', '2025-04-03', 5.00, 80.00),
		(14, 4, 'Cancelado', 'Compra de cadeira ergonômica', '2025-04-04', 20.00, 450.00),
		(15, 5, 'Confirmado', 'Compra de tênis esportivo', '2025-04-05', 12.00, 150.00);
select * from orders;

-- inserindo dados na tabela paymentType (idPaymentType, Type)
alter table paymentType auto_increment=1;
INSERT INTO paymentType (Type) VALUES 
		('Cartão'),
		('Boleto'),
		('Dinheiro');
select * from paymentType;

-- inserindo dados na tabela payment (idPorder, idPpaymentType, idCard, total, paymentDate)
alter table payment auto_increment=1;
insert into payment (idPorder, idPpaymentType, idCard, total, paymentDate) values
		(1, 1, 123456, 100.00, '2025-04-02 10:30:00'),  -- Pagamento com Cartão (idPpaymentType = 1)
		(2, 2, NULL, 50.00, '2025-04-02 11:00:00'),    -- Pagamento com Boleto (idPpaymentType = 2)
		(3, 3, NULL, 30.00, '2025-04-02 12:15:00'),    -- Pagamento com Dinheiro (idPpaymentType = 3)
        (4, 1, 987654, 200.00, '2025-04-03 14:00:00'),  -- Pagamento com Cartão (idPpaymentType = 1)
		(5, 2, NULL, 120.00, '2025-04-03 14:30:00'),    -- Pagamento com Boleto (idPpaymentType = 2)
		(6, 3, NULL, 45.00, '2025-04-03 15:00:00'),     -- Pagamento com Dinheiro (idPpaymentType = 3)
		(7, 1, 234567, 150.00, '2025-04-03 16:30:00'),  -- Pagamento com Cartão (idPpaymentType = 1)
		(8, 2, NULL, 75.00, '2025-04-03 17:00:00');     -- Pagamento com Boleto (idPpaymentType = 2)
select * from payment;

-- inserindo dados na tabela card (cardNumber, cardName, expirationDate, securityCode)
alter table card auto_increment=1;
select * from card;
insert into card (idCardPaymentType, cardNumber, cardName, expirationDate, securityCode) values 
		(1, '1234567812345678', 'Cartão de Crédito João Silva', '2025-12-31', '123'),
		(1, '2345678923456789', 'Cartão de Crédito Maria Oliveira', '2026-01-15', '456'),
		(1, '3456789034567890', 'Cartão de Crédito Carlos Souza', '2024-08-22', '789'),
		(1, '4567890145678901', 'Cartão de Crédito Ana Costa', '2027-05-05', '101'),
		(1, '5678901256789012', 'Cartão de Crédito Roberto Lima', '2023-11-30', '202');

-- inserindo dados na tabela productStorage 
alter table productStorage auto_increment=1;
insert into productStorage (idSproduct, storageLocation, quantity) values
		(1, 'São Paulo - Galpão A', 150),
		(1, 'Rio de Janeiro - Depósito B', 75),
		(2, 'São Paulo - Galpão A', 200),
		(2, 'Curitiba - Depósito C', 120),
		(3, 'Curitiba - Depósito C', 50),
		(3, 'São Paulo - Galpão A', 30),
		(4, 'Minas Gerais - Depósito D', 120),
		(5, 'São Paulo - Galpão A', 85),
		(5, 'Rio de Janeiro - Depósito B', 60),
		(6, 'São Paulo - Galpão A', 140),
		(6, 'Curitiba - Depósito C', 90),
		(7, 'São Paulo - Galpão A', 180),
		(7, 'Minas Gerais - Depósito D', 45),
		(8, 'São Paulo - Galpão A', 60),
		(8, 'Rio de Janeiro - Depósito B', 45),
		(9, 'Curitiba - Depósito C', 80),
		(9, 'São Paulo - Galpão A', 70),
		(10, 'Minas Gerais - Depósito D', 150),
		(10, 'São Paulo - Galpão A', 100);
select * from productStorage;

-- inserindo dados tabela supplier (companyName, CNPJ, cellPhone, email):
alter table supplier auto_increment=1;
insert into supplier (companyName, CNPJ, cellPhone, email) values
		('TechStore LTDA', '12.345.678/0001-90', '11987654321', 'contato@techstore.com.br'),
		('Moda & Estilo', '23.456.789/0001-01', '21876543210', 'atendimento@modaestilo.com.br'),
		('Brinquedos Kids', '34.567.890/0001-12', '11765432109', 'vendas@brinquedoskids.com.br'),
		('Super Alimentos', '45.678.901/0001-23', '48654321098', 'sac@superalimentos.com.br'),
		('Móveis Lar', '56.789.012/0001-34', '11543210987', 'suporte@móveislar.com.br'),
		('EletroWorld', '67.890.123/0001-45', '24432109876', 'sac@eletroworld.com.br'),
		('Livraria Universitária', '78.901.234/0001-56', '12321098765', 'contato@livrariauniversitaria.com.br');
select * from supplier;
delete from supplier;

-- inserindo dados na tabela seller (companyName, tradeName, CNPJ, CPF, location, cellPhone, email):
alter table seller auto_increment 1;
insert into seller (companyName, tradeName, CNPJ, CPF, location, cellPhone, email) values
		('Loja do Zé', 'Zé Empreendedor', '33.345.678/0001-89', '12345678901', 'São Paulo, SP', '11987654321', 'contato@loja-do-ze.com.br'),
		('Produtos da Maria', 'Maria Produtos', '67.456.789/0001-28', '23456789012', 'Rio de Janeiro, RJ', '11876543210', 'atendimento@mariaproducts.com.br'),
		('Brinquedos para Todos', 'Brinquedos da Ju', '24.567.890/0001-17', '34567890123', 'Belo Horizonte, MG', '11765432109', 'vendas@brinquedosju.com.br'),
		('Cozinha Prática', 'Prato Rápido', '08.678.901/0001-08', '45678901234', 'Curitiba, PR', '11654321098', 'suporte@cozinhapratica.com.br'),
		('Loja do Pedrão', 'Pedrão Store', '04.789.012/0001-06', '56789012345', 'Porto Alegre, RS', '11543210987', 'contato@lojapedrao.com.br'),
		('Beleza e Estilo', 'Beleza em Casa', '17.890.123/0001-08', '67890123456', 'Fortaleza, CE', '11432109876', 'sac@belezaemcasa.com.br'),
		('TecnoSmart', 'SmartTec', '11.901.234/0001-07', '78901234567', 'Salvador, BA', '11321098765', 'contato@tecnosmart.com.br'),
		('Canto do Artesão', 'Artesanato para Todos', '02.012.345/0001-11', '89012345678', 'Recife, PE', '11210987654', 'artesanato@cantodartesao.com.br'),
		('Mundo Infantil', 'Mundo dos Brinquedos', '20.123.456/0001-24', '90123456789', 'Manaus, AM', '11109876543', 'contato@mundoinfantil.com.br'),
		('Casa e Decoração', 'Decore Fácil', '05.234.567/0001-10', '01234567890', 'Natal, RN', '11098765432', 'sac@casaedecoracao.com.br');
select * from seller;

-- inserindo dados na tabela shipping
alter table shipping auto_increment=1;
insert into shipping (idShOrder, statusShipping, trackingCode, shippingDate, deliveryDate) values
		(1, 'Na transportadora', 'TRK001', '2025-04-01 10:00:00', '2025-04-03 14:00:00'),
		(2, 'A caminho', 'TRK002', '2025-04-02 09:30:00', '2025-04-05 16:00:00'),
		(3, 'Entregue', 'TRK003', '2025-04-03 11:00:00', '2025-04-04 13:00:00'),
		(4, 'Na transportadora', 'TRK004', '2025-04-04 08:45:00', '2025-04-06 15:00:00'),
		(5, 'Entregue', 'TRK005', '2025-04-05 10:00:00', '2025-04-07 12:30:00'),
		(6, 'A caminho', 'TRK006', '2025-04-06 14:00:00', '2025-04-08 17:00:00'),
		(7, 'Na transportadora', 'TRK007', '2025-04-07 09:00:00', '2025-04-09 14:30:00'),
		(8, 'Entregue', 'TRK008', '2025-04-08 10:15:00', '2025-04-10 11:00:00'),
		(9, 'A caminho', 'TRK009', '2025-04-09 13:00:00', '2025-04-11 19:30:00'),
		(10, 'Na transportadora', 'TRK010', '2025-04-10 15:30:00', '2025-04-12 20:00:00');
select * from shipping;

-- inserindo dados na tabela produto por vendedor-terceiros: productSeller (idPseller, idProduct, prodQuantity):
insert into productSeller (idPseller, idProduct, prodQuantity) values
		(1, 2, 15),  -- Vendedor 1 vende 15 unidades do Produto 2
		(2, 1, 20),  -- Vendedor 2 vende 20 unidades do Produto 1
		(2, 3, 5),   -- Vendedor 2 vende 5 unidades do Produto 3
		(3, 4, 30),  -- Vendedor 3 vende 30 unidades do Produto 4
		(3, 5, 50),  -- Vendedor 3 vende 50 unidades do Produto 5
		(4, 2, 8),   -- Vendedor 4 vende 8 unidades do Produto 2
		(5, 1, 12),  -- Vendedor 5 vende 12 unidades do Produto 1
		(6, 3, 25),  -- Vendedor 6 vende 25 unidades do Produto 3
		(7, 5, 7),   -- Vendedor 7 vende 7 unidades do Produto 5
        (8, 8, 12),  -- Vendedor 8 vende 12 unidades do Produto 8
		(9, 9, 25),  -- Vendedor 9 vende 25 unidades do Produto 9
		(10, 1, 7);   -- Vendedor 10 vende 7 unidades do Produto 10
        
select * from productSeller;

select * from supplier;
-- inserindo dados na tabela produto por fornecedor: productSupplier (idPsSupplier, idPsProduct, quantity):
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
		(1, 1, 500),  -- Fornecedor 1 fornece 500 unidades do Produto 1
		(1, 6, 300),  -- Fornecedor 1 fornece 300 unidades do Produto 6
		(2, 2, 700),  -- Fornecedor 2 fornece 700 unidades do Produto 2
		(2, 7, 150),  -- Fornecedor 2 fornece 150 unidades do Produto 7
		(3, 3, 600),  -- Fornecedor 3 fornece 600 unidades do Produto 3
		(3, 8, 200),  -- Fornecedor 3 fornece 200 unidades do Produto 8
		(4, 4, 450),  -- Fornecedor 4 fornece 450 unidades do Produto 4
        (4, 9, 450),  -- Fornecedor 4 fornece 450 unidades do Produto 9
        (5, 5, 800),  -- Fornecedor 5 fornece 800 unidades do Produto 5
		(5, 10, 800),  -- Fornecedor 5 fornece 800 unidades do Produto 10
		(6, 1, 250),  -- Fornecedor 6 fornece 250 unidades do Produto 1
		(7, 6, 100);  -- Fornecedor 7 fornece 100 unidades do Produto 6
select * from productSupplier;

select * from orders;
-- criar tabela produto por pedido:
insert into productOrders (idPOproduct, idPOorder, poQuantity, poStatus) values
(1, 1, 2, 'Cancelado'),            -- Pedido 1, Produto 1, Quantidade 2, Status "Cancelado"
(2, 1, 1, 'Cancelado'),            -- Pedido 1, Produto 2, Quantidade 1, Status "Cancelado"
(3, 2, 3, 'Confirmado'),           -- Pedido 2, Produto 3, Quantidade 3, Status "Confirmado"
(4, 2, 2, 'Confirmado'),           -- Pedido 2, Produto 4, Quantidade 2, Status "Confirmado"
(5, 3, 5, 'Em processamento'),     -- Pedido 3, Produto 5, Quantidade 5, Status "Em processamento"
(6, 3, 4, 'Em processamento'),     -- Pedido 3, Produto 6, Quantidade 4, Status "Em processamento"
(7, 4, 1, 'Em processamento'),     -- Pedido 4, Produto 7, Quantidade 1, Status "Em processamento"
(8, 4, 2, 'Em processamento'),     -- Pedido 4, Produto 8, Quantidade 2, Status "Em processamento"
(9, 5, 3, 'Enviado'),              -- Pedido 5, Produto 9, Quantidade 3, Status "Enviado"
(10, 5, 1, 'Enviado');             -- Pedido 5, Produto 10, Quantidade 1, Status "Enviado"
-- inserindo mais dados em productOrders:
insert into productOrders (idPOorder, idPOproduct, poQuantity, poStatus) values
		(11, 1, 1, 'Em processamento'), -- Produto 1 (Produto ID 1 - Notebook)
		(11, 2, 2, 'Em processamento'), -- Produto 2 (Produto ID 2 - Smartphone)
		(12, 3, 1, 'Em processamento'), -- Produto 1 (Produto ID 3 - Camisa polo)
		(12, 4, 3, 'Em processamento'), -- Produto 2 (Produto ID 4 - Cadeira ergonômica) 
		(13, 5, 2, 'Entregue'), -- Produto 1 (Produto ID 5 - Tênis esportivo)
		(13, 6, 1, 'Entregue'), -- Produto 2 (Produto ID 6 - Mochila esportiva)
		(14, 7, 1, 'Cancelado'), -- Produto 1 (Produto ID 7 - Smartphone)
		(14, 8, 2, 'Cancelado'), -- Produto 2 (Produto ID 8 - Tênis de corrida)
		(15, 9, 3, 'Confirmado'), -- Produto 1 (Produto ID 9 - Relógio de pulso)
		(15, 10, 1, 'Confirmado'); -- Produto 2 (Produto ID 10 - Cadeira gamer)
select * from productOrders;

use ecommerce;
-- realizando consultas no banco de dados ecommerce


-- Quantos pedidos foram feitos por cada cliente?
SELECT idOrderClient, COUNT(idOrder) AS totalPedidos
		FROM orders
		GROUP BY idOrderClient;

-- Algum vendedor também é fornecedor?
SELECT s.CNPJ
		FROM seller s
		JOIN supplier sp ON s.CNPJ = sp.CNPJ;

-- Relação de produtos fornecedores e estoques:
-- Supplier (Fornecedor)
SELECT p.idProduct,
		p.Pname AS NomeProduto,
		s.companyName AS Fornecedor,
		ps.quantity AS Quantidade,
		psStorage.quantity AS Estoque
		FROM product p
		JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
		JOIN supplier s ON ps.idPsSupplier = s.idSupplier
		JOIN productStorage psStorage ON p.idProduct = psStorage.idProdStorage;

-- Seller (Vendedor/Terceiro):
SELECT p.idProduct,
		p.Pname AS NomeProduto,
		s.companyName AS Vendedor,
		ps.ProdQuantity AS Quantidade
		FROM product p
		JOIN productSeller ps ON p.idProduct = ps.idProduct
		JOIN seller s ON ps.idPSeller = s.idSeller
		JOIN productStorage psStorage ON p.idProduct = psStorage.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos:
SELECT p.idProduct,
		p.Pname AS NomeProduto,
		s.companyName AS Fornecedor
		FROM product p
		JOIN productSupplier ps ON p.idProduct = ps.idPsProduct
		JOIN supplier s ON ps.idPsSupplier = s.idSupplier
        ORDER BY p.Pname;
        
-- cliente que comprou suco:
SELECT concat(c.Fname, ' ', Lname) AS Cliente,
		p.Pname AS NomeProduto,
		o.idOrder AS idPedido
		FROM clients c
		JOIN orders o ON c.idClient = o.idOrderClient
		JOIN productOrders po ON o.idOrder = po.idPOorder
		JOIN product p ON po.idPOproduct = p.idProduct
		WHERE p.Pname like 'suco%';

-- pagamento com cartão:
select idPorder, idPpaymentType from payment WHERE idPpaymentType=1;

-- quantos clientes são pessoa física e pessoa jurídica?
desc clients;

SELECT COUNT(idClient) AS quantidade, typeClient AS tipo_cliente
		FROM clients
        GROUP BY typeClient;

-- onde estoques estão localizados?
desc productStorage;
SELECT storageLocation FROM productStorage;

-- onde o estoque total de produtos é menor ou igua a 500?
SELECT storageLocation, SUM(quantity) AS qtd
		FROM productStorage
        GROUP BY storageLocation
        HAVING SUM(quantity) <= 500;
        
-- onde o estoque de produtos específicos é menor ou igua a 50?
SELECT storageLocation, idSproduct, SUM(quantity) AS totalQuantity
		FROM productStorage
		GROUP BY storageLocation, idSproduct
		HAVING SUM(quantity) < 50;

-- quantos pedidos foram cancelados?
SELECT idOrderClient, COUNT(idOrder) AS total_cancelados
		FROM orders
        WHERE orderStatus = 'Cancelado'
        GROUP BY idOrder;

-- pedidos que estão na transportadora:
SELECT idShipping, COUNT(idShOrder) AS Na_transportadora
		FROM shipping
		WHERE statusShipping = 'Na transportadora'
		GROUP BY idShipping;