create database BioTec;
use BioTec;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(40),
cnpj char(14),
logradouro varchar(50),
numLogradouro varchar(10), 
bairro varchar(50),
cidade varchar(50),
cep char(9),
emailEmpresa varchar(50),
senhaEmpresa varchar(50)
)auto_increment = 1000;

create table Veiculo(
idVeiculo int primary key auto_increment,
modeloVeiculo varchar(40),
placaVeiculo varchar(8),
tamanhoBau float -- metros quadrados m²
)auto_increment = 5000;

create table Motorista(
cpfMotorista varchar(20) primary key,
nomeMotorista varchar (40),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa),
fkVeiculo int,
foreign key (fkVeiculo) references Veiculo(idVeiculo)
);

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
(null, 'EmpresaTop', '57213650000132', 'empresaTop@gmail.com', 'empresaTop123');
-- (null , 'XMan-Evolution', '09361-110'),
-- (null , 'Sancargo','04356-000');

select * from Empresa;


insert into Veiculo values
(null , 'R440' , 'DEF-8598' , '20.5');

select * from Veiculo;


insert into Motorista values
('06485568955', 'Maicão Perez', 1000, 5000);

select * from Motorista;


insert into Dados values
(null, '2020-10-05 15:00', 'DHT11 - 1', '6.5', '10%', 5000);
-- (null , '2020-10-05 14:53' , 'DHT11 - 1', '5.5' , '50%' , null);

select * from Dados;