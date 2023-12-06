create database dbCanesProfessora;
use dbCanesProfessora;

create table funcionarios (
	idFunc int primary key auto_increment,
    nomeFunc varchar(60) not null,
	login varchar(20) not null unique,
    email varchar(50) not null unique,
    senha varchar(255) not null,
    departamento enum("Administração", "Líderes", "Vendedores Locais",
    "Vendedores Externos", "Logística", "Diretoria")
);

create table fornecedores (
	idForn int primary key auto_increment,
    nomeForn varchar(50) not null,
    cnpjForn varchar(20) not null unique,
    telForn varchar(20) not null,
    emailForn varchar(50) not null unique,
    cep varchar(9),
    enderecoForn varchar(100),
    numEndereco varchar(10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);


create table produtos (
	idProd int primary key auto_increment,
    nomeProd varchar(50) not null,
    descricaoProd text,
    precoProd decimal (10,2) not null,
    estoqueProd int not null,
    categoriaProd enum("Limpeza", "Higiene"),
    idForn int not null,
    foreign key (idForn) references fornecedores (idForn)
);

create table clientes (
	idCliente int primary key auto_increment,
    nome varchar(100) not null,
    cpf char(14) not null unique,
	cnpj varchar(20) unique,
	tel varchar(20) not null,
    email varchar(50) not null unique,
	cep varchar(9),
    endereco varchar(100),
    numEndereco varchar(10),
    bairro varchar(40),
    cidade varchar(40),
    estado char(2)
);

create table pedidos (
	idPed int primary key auto_increment,
    dataPed timestamp default current_timestamp,
    statusPed enum ("Pendente", "Finalizado", "Cancelado") not null,
    idFunc int not null,
    foreign key (idFunc) references funcionarios (idFunc),
    idCliente int not null,
    foreign key (idCliente) references clientes (idCliente)
);

create table itensPedidos (
	idItensPed int primary key auto_increment,
    idPed int not null,
    idProd int not null,
    foreign key (idPed) references pedidos (idPed),
    foreign key (idProd) references produtos (idProd),
	quantidade int not null
);








