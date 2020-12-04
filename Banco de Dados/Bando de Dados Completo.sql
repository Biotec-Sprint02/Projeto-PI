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
senhaEmpresa varchar(30)
)auto_increment = 1000;

create table Veiculo(
idVeiculo int primary key auto_increment,
modeloVeiculo varchar(40),
placaVeiculo varchar(8),
tamanhoBau decimal (6,2) -- metros cubicos m³
)auto_increment = 5000;

create table Motorista(
cpfMotorista varchar(20) primary key,
nomeMotorista varchar (40),
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa),
fkVeiculo int,
foreign key (fkVeiculo) references Veiculo(idVeiculo)
);

create table Sensor(
idSensor int primary key auto_increment,
fkVeiculo int,
foreign key (fkVeiculo) references Veiculo(idVeiculo)
);

create table Dados(
logDados datetime,
temperatura float, -- em graus °C
umidade varchar(20),
fkSensor int,
foreign key (fkSensor) references Sensor(idSensor)
);
-- --------------------------------------------------------------------------------------------------------------------------
-- ==========================================================================================================================
-- 											Separação das Tabelas e dos Inserts
-- ==========================================================================================================================
-- --------------------------------------------------------------------------------------------------------------------------
insert into Empresa values 
(null, 'EmpresaTop', '57213650000132', 'Rua Haddock Lobo', '1000', 'Limeira', 'Sao Paulo', '09922000', 'empresatop@gmail.com', '12345678'),
(null, 'Transnova', '57213650000999', 'Av. Paulista', '13', 'Consolação', 'Sao Paulo', '03344000', 'transnova@gmail.com', '23456789'),
(null, 'Bioexpress', '57213650000888', 'Rua Augusta', '66', 'Praça da Árvore', 'Sao Paulo', '01942000', 'bioexpress@gmail.com', '12301230'),
(null, 'Patrus', '57213650000777', 'Rua Bela Cintra', '234', 'Chácara Klabin', 'Sao Paulo', '01352400', 'patrus@gmail.com', '12457890'),
(null, 'expressoARGHI', '57213650000555', 'Rua Jabaquara', '6740', 'Saúde', 'Sao Paulo', '18522000', 'expressoarghi@gmail.com', '98765432');

select * from Empresa;

insert into Veiculo values
(null , 'R440' , 'DEF-8598' , '20.5'),
(null , '110RH' , 'DAF-7854' , '24.5'),
(null , '789DD' , 'BEF-1234' , '22.5'),
(null , 'FH460' , 'OEF-6543' , '18.5'),
(null , 'TR66-1' , 'PRF-8376' , '16.5');

select * from Veiculo;

insert into Motorista values
('06485568777', 'Maicão Perez', 1000, 5000),
('06485568666', 'José Luiz', 1001, 5001),
('06485568555', 'Paulo Silva', 1002, 5002),
('06485568444', 'João de Deus', 1003, 5003),
('06485568333', 'Bruno Santos', 1004, 5004);

select * from Motorista;

insert into Sensor values
(null, 5000),
(null, 5001),
(null, 5002),
(null, 5003),
(null, 5004);

select * from Sensor;

insert into Dados values
('2020-11-05 15:00', '3.5', '50%', 1),
('2020-12-09 16:00', '2.5', '60%', 2),
('2020-09-08 17:00', '5', '45%', 3),
('2020-08-07 18:00', '6.5', '63%', 4),
('2020-07-06 19:00', '6.8', '57%', 5);

select * from Dados;