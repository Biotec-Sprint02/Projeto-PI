create database BioTec;

use BioTec;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(40),
cep varchar(40)
)auto_increment = 1000;

select * from Empresa;

create table Motorista(
cpfMotorista char(15) primary key,
nomeMotorista varchar (40),
modeloVeiculo varchar (40)
);

select * from Motorista;

create table Lote(
idLote int primary key auto_increment,
nomeRemedio varchar (40),
quantidade int
)auto_increment = 50000;

select * from Lote;

create table dadosAPI(
idDados int primary key auto_increment, -- Sensor DhT11
sensor varchar(10),
temperatura float,
umidade varchar(20)
)auto_increment = 100000;

select * from dadosAPI;

create table Login(
fkcpfMotorista char(15),
email varchar (55),
senha varchar (40),
foreign key (fkcpfMotorista) references Motorista(cpfMotorista)
);

select * from Login;

create table Trajeto(
idViagem int primary key auto_increment,
inicio varchar(50),
destino varchar(50),
horaSaida datetime,
horaChegada datetime,
fkcpfMotorista char(15),
fkLote int,
fkDados int,
foreign key(fkcpfMotorista) references Motorista(cpfMotorista),
foreign key(fkLote) references Lote(idLote),
foreign key(fkDados) references dadosAPI(idDados)
)auto_increment = 500000;

select * from Trajeto;
desc Trajeto;

-- --------------------------------------------------------------------------------------------------------------------------
-- ==========================================================================================================================
-- 											Separação das Tabelas e dos Inserts
-- ==========================================================================================================================
-- --------------------------------------------------------------------------------------------------------------------------

insert into Empresa values 
(null, 'XMan-Evolution', '09361-110');

select * from Empresa;

insert into Motorista values 
(23745527802 , 'José das Couves' , 'Ford - R440');

select * from Motorista;

insert into Lote values
(null, 'Decadron', '50');

select * from Lote;

insert into dadosAPI values
(null,'DHT11 - 1' , '1.5' , '30%');

select * from dadosAPI;

insert into Login values
(23745527802, 'Xman@evolution.com', 'Versão Brasileira Hebbert Richards');

select * from Login,Motorista where fkcpfMotorista = cpfMotorista;

insert into Trajeto values
(null , 'Av. das Magnólias - Jardim Cardoso nº1010' , 'Itaquaquecetuba - Esqueci nº15' , 
'2020-05-25 08:30:05' , '2020-05-26 00:31:05' , 23745527802 , 50000 , 100000 );

select * from Trajeto,Motorista,Lote,dadosAPI where fkcpfMotorista = cpfMotorista and fkLote = idLote
and fkDados = idDados;