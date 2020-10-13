create database BioTec;
use BioTec;

create table login(
idLogin int primary key,
email varchar (55),
senha varchar (20)
);

create table trajeto(
idViagem int primary key auto_increment,
inicio varchar(50),
destino varchar(50),
horasaida datetime,
horachegada datetime,
fkMotorista int,
fkLote int,
fkSensor int,
foreign key(fkMotorista) references motorista(idMotorista),
foreign key(fkLote) references lote(idLote),
foreign key(fkSensor) references sensor(idSensor)
)auto_increment = 100000;

insert into login values
(100, 'joãobatista@gmail.com', '12345678'),
(101, 'paulacarvalho@outlook.com', '25262728'),
(102, 'gabrielamiranda@gmail.com', '35363637'),
(103, 'caiogomesvieira@gmail.com', '46589302'); 

select * from trajeto;
desc trajeto;

create table empresa(
idEmpresa int primary key,
nomeEmpresa varchar(40),
cep varchar(40)
);

insert into empresa values 
(1000, 'Via Expressa', '02052-001')
,(2000, 'Raizes Transportes', '21011-180')
,(3000, 'TransNova', '04782-000')
,(4000, 'BCL express', '04561-060');

select * from empresa;

create table motorista(
IdMotorista int primary key, -- Colocamos isso pois no CPF ja tem CNH e o RG porem n sabemos se sera isso.
nomeMotorista varchar (40),
CPFmotorista char (15),  
modeloVeiculo varchar (40)
);


insert into motorista values 
(1, 'Gael Davi Hugo','077.491.058-59', 'Caminhao', '2020-09-09', '2020-10-10')
,(2, 'Enzo Ruan Pinto','520.203.278-13', 'Carro', '2020-10-10', '2020-11-11') 
,(3, 'Augusto Fernando Alves','235.868.078-80', 'Moto', '2020-11-11', '2020-12-12')
,(4, 'Theo Guilherme José','538.790.158-72', 'Caminhao', '2020-12-12', '2020-12-13');

select * from motorista;

create table lote(
idLote int primary key,
nomeRemedio varchar (40),
quantidade int
);


insert into lote values
(122, 'Insulina', '50')
,(344, 'Xalacon', '55')
,(566, 'Miacalcic Spray nasal', '60')
,(788,'Foraseq', '65');

select * from lote;

create table sensor(
idSensor int primary key, -- Sensor DhT11
temperatura float,
umidade varchar(20)
);

insert into sensor values
(001,2.2,'3%')
,(002,4.0,'2%')
,(003,6.1,'1%')
,(004,7.6,'0%');

select * from sensor;