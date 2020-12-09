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
senhaEmpresa varchar(30),
telefone1 bigint,
telefone2 bigint null
)auto_increment = 1000;

create table Veiculo(
idVeiculo int primary key auto_increment,
modeloVeiculo varchar(40),
placaVeiculo varchar(8),
tamanhoBau decimal (6,2), -- metros cubicos m³
fkEmpresaVeiculo int,
foreign key (fkEmpresaVeiculo) references Empresa(idEmpresa)
)auto_increment = 5000;

create table Motorista(
cpfMotorista bigint primary key,
nomeMotorista varchar (40),
telefoneMotorista bigint,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa),
fkVeiculoMotorista int,
foreign key (fkVeiculoMotorista) references Veiculo(idVeiculo)
);

create table Sensor(
idSensor int primary key auto_increment,
fkVeiculo int,
foreign key (fkVeiculo) references Veiculo(idVeiculo)
);

create table Dados(
logDados datetime,
temperatura float, -- em graus °C
umidade float,
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor),
primary key(fkSensor)
);

create table Viagem(
idViagem int primary key auto_increment,
statusViagem int,
fkveiculoviagem int,
fkmotoristaviagem bigint,
foreign key (fkmotoristaviagem) references motorista(cpfMotorista),
foreign key (fkveiculoviagem) references veiculo(idveiculo)
)auto_increment = 100000;

-- --------------------------------------------------------------------------------------------------------------------------
-- ==========================================================================================================================
-- 											Separação das Tabelas e dos Inserts
-- ==========================================================================================================================
-- --------------------------------------------------------------------------------------------------------------------------
insert into Empresa values 
(null, 'EmpresaTop', '57213650000132', 'Rua Haddock Lobo', '1000', 'Limeira', 'Sao Paulo', '09922000', 'empresatop@gmail.com', '12345678', 11988887777, 11966665555),
(null, 'Transnova', '57213650000999', 'Av. Paulista', '13', 'Consolação', 'Sao Paulo', '03344000', 'transnova@gmail.com', '23456789', 31999887766, 31988222277),
(null, 'Bioexpress', '57213650000888', 'Rua Augusta', '66', 'Praça da Árvore', 'Sao Paulo', '01942000', 'bioexpress@gmail.com', '12301230', 11945678987, 11987234523),
(null, 'Patrus', '57213650000777', 'Rua Bela Cintra', '234', 'Chácara Klabin', 'Sao Paulo', '01352400', 'patrus@gmail.com', '12457890', 11990807060, 11991234567),
(null, 'expressoARGHI', '57213650000555', 'Rua Jabaquara', '6740', 'Saúde', 'Sao Paulo', '18522000', 'expressoarghi@gmail.com', '98765432', 11977447744, 11981828384);

select * from Empresa;

insert into Veiculo values
(null , 'R440' , 'DEF-8598' , '20.5', 1000),
(null , '110RH' , 'DAF-7854' , '24.5', 1001),
(null , '789DD' , 'BEF-1234' , '22.5', 1002),
(null , 'FH460' , 'OEF-6543' , '18.5', 1003),
(null , 'TR66-1' , 'PRF-8376' , '16.5', 1004);

select * from Veiculo;

insert into Motorista values
('06485568777', 'Maicão Perez', 11971717171, 1000, 5000),
('06485568666', 'José Luiz', 11980996677, 1001, 5001),
('06485568555', 'Paulo Silva', 11987651234, 1002, 5002),
('06485568444', 'João de Deus', 31997958786, 1003, 5003),
('06485568333', 'Bruno Santos',  31998979696, 1004, 5004);

select * from Motorista;

insert into Sensor values
(null, 5000),
(null, 5001),
(null, 5002),
(null, 5003),
(null, 5004);

select * from Sensor;

insert into Dados values
('2020-11-05 15:00', '3.5', '50', 1),
('2020-12-09 16:00', '2.5', '60', 2),
('2020-09-08 17:00', '5', '40', 3),
('2020-08-07 18:00', '6.5', '63', 4),
('2020-07-06 19:00', '6.8', '57', 5);

select * from Dados;

insert into Viagem values
(null, 1, 5000, 06485568777),
(null, 0, 5001, 06485568666),
(null, null, 5002, 06485568555),
(null, 1, 5003, 06485568444),
(null, 1, 5004, 06485568333);

select * from Viagem;

-- Esse código aqui é para dropar o database quando necessário
-- drop database BioTec;