create database BioTec;
use BioTec;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(40),
cep varchar(40)
)auto_increment = 1000;

create table Login(
cpfMotorista varchar(20) primary key,
senha varchar(20),
email varchar(40),
nomeMotorista varchar (40),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
);

create table Veiculo(
idVeiculo int primary key auto_increment,
modeloVeiculo varchar (40),
tamanhoBau float -- metros quadrados m²
)auto_increment = 50000;

create table Dados(
idDados int primary key auto_increment,
logDados datetime,
sensor varchar(10),
temperatura float, -- em graus °C
umidade varchar(20),
fkVeiculo int,
foreign key (fkVeiculo) references Veiculo(idVeiculo)
)auto_increment = 100000;

-- --------------------------------------------------------------------------------------------------------------------------
-- ==========================================================================================================================
-- 											Separação das Tabelas e dos Inserts
-- ==========================================================================================================================
-- --------------------------------------------------------------------------------------------------------------------------

insert into Empresa values 
(null , 'XMan-Evolution', '09361-110'),
(null , 'Sancargo','04356-000');

select * from Empresa;

insert into Login values
(23745527802 , 'luiz123' , 'luiz.gsilva@bandtec.com.br' , 'João Pedro' , null);

select * from Login;

insert into Veiculo values
(null , 'R440' , '20.5');

select * from Veiculo;

insert into Dados values
(null , '2020-10-05 14:53' , 'DHT11 - 1', '5.5' , '50%' , null);
