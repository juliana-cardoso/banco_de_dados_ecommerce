-- criar banco de dados ecommerce:
create schema if not exists ecommerce;
use ecommerce;

-- criar tabela cliente (clients), sendo ou PF ou PJ.
create table clients( 
		idClient int auto_increment primary key, 
		Fname varchar(10), 
		Minit char(3), 
		Lname varchar(20), 
		CPF char(11) not null, -- excluído
		Address varchar(255),
        Email varchar(100) not null,
        CellPhone varchar(15) not null,
		constraint unique_cpf_client unique (CPF), -- excluído
        constraint unique_email_client unique (Email)
);
alter table clients auto_increment=1;
alter table clients add column typeClient enum('PF', 'PJ') not null unique;
alter table clients drop column typeClient;
alter table clients add column typeClient enum('PF', 'PJ') not null;
alter table clients drop column CPF;
desc clients;

-- criar tabela pessoa física:
create table clients_pf(
		idClient int primary key not null,
        CPF char(11) not null,
        birthDate date not null,
        constraint unique_cpf_client unique (CPF),
        constraint fk_idClientpf_client foreign key (idClient) references clients (idClient)
);
desc clients_pf;

-- criar tabela pessoa jurídica:
create table clients_pj(
		idClient int primary key not null,
        CNPJ char(18) not null,
        companyName varchar(100) not null unique,
        tradeName varchar(100) not null,
        constraint unique_CNPJ_client unique (CNPJ),
        constraint fk_idClientpj_client foreign key (idClient) references clients (idClient)
);
desc clients_pj;

-- criar tabela produto:
create table product( 
		idProduct int auto_increment primary key, 
		Pname varchar(45) not null, 
		classification_kids bool default false, 
		category enum('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis') not null, 
		feedback float default 0, 
		size varchar(10)
);
alter table product auto_increment=1;
desc product;

-- criar tabela pedido: 
create table orders(
		idOrder int auto_increment primary key, 
		idOrderClient int, 
		orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento', 
		orderDescription varchar(255),
        dateOrder datetime default current_timestamp,
		shippingCost float default 10, 
		totalValue float not null,
		constraint fk_ordes_client foreign key (idOrderClient) references clients (idClient)
		on update cascade
);
alter table orders auto_increment=1;
desc orders;

-- criar tabela tipo de pagamento:
create table paymentType (
    idPaymentType int auto_increment primary key,
    Type enum('Cartão', 'Boleto', 'Dinheiro') default 'Cartão'
);
alter table paymentType auto_increment=1;
desc paymentType;

-- criar tabela pagamento, onde idCard pode ser nulo, caso a forma de pagamento seja boleto ou dinheiro:
create table payment( 
		idPayment int auto_increment primary key,
        idPorder int not null, 
		idPpaymentType int not null, 
		idCard int, -- campo retirado
        total float not null,
		paymentDate datetime default current_timestamp,
		constraint fk_idPorder_orders foreign key (idPorder) references orders(idOrder),
        constraint fk_idPpaymentType_paymentType foreign key (idPpaymentType) references PaymentType(idPaymentType)
);
alter table payment drop column idCard;
alter table payment auto_increment 1;
desc payment;

-- criar tabela cartão:
CREATE TABLE card(
    idCard int auto_increment primary key,
    idCardPaymentType int not null,
    cardNumber varchar(16) not null,
    cardName varchar(100) not null,
    expirationDate date not null,
    securityCode varchar(3) not null,
    constraint fk_idCard_paymentType foreign key (idCardPaymentType) references PaymentType(idPaymentType)
);
alter table card auto_increment=1;
desc card;
select * from card;
-- criar tabela estoque:
create table productStorage( 
		idProdStorage int auto_increment primary key, 
		idSproduct int not null,
        storageLocation varchar(255), 
		quantity int default 0,
        constraint fk_StorageProduct_product foreign key (idSproduct) references product(idProduct)
);
alter table productStorage auto_increment=1;
desc productStorage;

-- criar tabela fornecedor:
create table supplier( 
		idSupplier int auto_increment primary key, 
		companyName varchar(100) not null, 
		CNPJ char(18) not null, 
		cellPhone char(11) not null,
        email varchar(100) not null unique,
		constraint unique_supplier unique (CNPJ)
);
alter table supplier auto_increment=1;
desc supplier;

-- criar tabela tabela vendedor:
create table seller( 
		idSeller int auto_increment primary key, 
		companyName varchar(100) not null, 
		tradeName varchar(100), 
		CNPJ char(18), 
		CPF char(11), 
		location varchar(255), 
		cellPhone char(11) not null,
        email varchar(100) not null unique,
		constraint unique_cnpj_seller unique (CNPJ), 
		constraint unique_cpf_seller unique (CPF) 
);
alter table seller auto_increment 1;
desc seller;

-- criar tabela entrega:
create table shipping(
		idShipping int auto_increment primary key,
		idShOrder int not null, 
		statusShipping enum('Na transportadora', 'A caminho', 'Entregue') not null,
		trackingCode varchar(30), -- Código de rastreio da entrega (opcional, dependendo do status)
		shippingDate datetime not null, -- Data de envio
		deliveryDate datetime not null, -- Data de recebimento do pedido
		constraint fk_shipping_order_shipping foreign key (idShOrder) references orders(idOrder)
);
alter table shipping auto_increment 1;
desc shipping;

-- criar tabela produto por vendedor (terceiro):
create table productSeller( 
		idPseller int not null, 
		idProduct int not null, 
		prodQuantity int default 1, 
		primary key (idPseller, idProduct), 
		constraint fk_product_seller foreign key (idPseller) references seller(idSeller), 
		constraint fk_product_product foreign key (idProduct) references product(idProduct) 
);
desc productSeller;

-- criar tabela produto por fornecedor:
create table productSupplier( 
		idPsSupplier int not null, 
		idPsProduct int not null, 
		quantity int not null, 
		primary key (idPsSupplier, idPsProduct), 
		constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier (idSupplier), 
		constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct) 
);
desc productsupplier;

-- criar tabela produto por pedido:
create table productOrders(
		idPOproduct int,
        idPOorder int,
        poQuantity int not null,
        poStatus varchar(25),
        primary key (idPOorder, idPOproduct), 
		constraint fk_product_orders_order foreign key (idPOorder) references orders (idOrder), 
		constraint fk_product_orders_product foreign key (idPOProduct) references product(idProduct) 
);
desc productOrders;

show tables;