create database blackJack1;
use blackJack1;

create table Usuarios(
id int not null auto_increment primary key,
usuario varchar(60) not null,
pass varchar(60) not null
);

create table Cartas(
id int not null auto_increment primary key,
numero varchar(3) not null,
palo varchar(12) not null,
valor int not null
);

create table Partidas(
id int not null auto_increment primary key,
id_usuario int not null,
fecha datetime not null,
foreign key (id_usuario) references Usuarios(id) 
);

create table Jugadas(
id int not null auto_increment primary key,
id_partida int not null,
puntos_jugador int not null,
puntos_croupier int not null,
ganador varchar(60),
foreign key (id_partida) references Partidas(id) 
);

create table Detalles_jugador(
id int not null auto_increment primary key,
id_jugada int not null,
id_carta int not null,
foreign key (id_jugada) references Jugadas(id) ,
foreign key (id_carta) references Cartas(id) 
);

create table Detalles_croupier(
id int not null auto_increment primary key,
id_jugada int not null,
id_carta int not null,
foreign key (id_jugada) references Jugadas(id) ,
foreign key (id_carta) references Cartas(id) 
);

create table Cartas_usadas(
id int not null auto_increment primary key,
id_partida int not null,
id_carta int not null,
foreign key (id_partida) references Partidas(id), 
foreign key (id_carta) references Cartas(id)
);

insert into Cartas (numero, palo, valor) values('As', 'Diamante', 11);
insert into Cartas (numero, palo, valor) values('2', 'Diamante', 2);
insert into Cartas (numero, palo, valor) values('3', 'Diamante', 3);
insert into Cartas (numero, palo, valor) values('4', 'Diamante', 4);
insert into Cartas (numero, palo, valor) values('5', 'Diamante', 5);
insert into Cartas (numero, palo, valor) values('6', 'Diamante', 6);
insert into Cartas (numero, palo, valor) values('7', 'Diamante', 7);
insert into Cartas (numero, palo, valor) values('8', 'Diamante', 8);
insert into Cartas (numero, palo, valor) values('9', 'Diamante', 9);
insert into Cartas (numero, palo, valor) values('10', 'Diamante', 10);
insert into Cartas (numero, palo, valor) values('J', 'Diamante', 10);
insert into Cartas (numero, palo, valor) values('Q', 'Diamante', 10);
insert into Cartas (numero, palo, valor) values('K', 'Diamante', 10);

insert into Cartas (numero, palo, valor) values('As', 'Trebol', 11);
insert into Cartas (numero, palo, valor) values('2', 'Trebol', 2);
insert into Cartas (numero, palo, valor) values('3', 'Trebol', 3);
insert into Cartas (numero, palo, valor) values('4', 'Trebol', 4);
insert into Cartas (numero, palo, valor) values('5', 'Trebol', 5);
insert into Cartas (numero, palo, valor) values('6', 'Trebol', 6);
insert into Cartas (numero, palo, valor) values('7', 'Trebol', 7);
insert into Cartas (numero, palo, valor) values('8', 'Trebol', 8);
insert into Cartas (numero, palo, valor) values('9', 'Trebol', 9);
insert into Cartas (numero, palo, valor) values('10', 'Trebol', 10);
insert into Cartas (numero, palo, valor) values('J', 'Trebol', 10);
insert into Cartas (numero, palo, valor) values('Q', 'Trebol', 10);
insert into Cartas (numero, palo, valor) values('K', 'Trebol', 10);

insert into Cartas (numero, palo, valor) values('As', 'Corazon', 11);
insert into Cartas (numero, palo, valor) values('2', 'Corazon', 2);
insert into Cartas (numero, palo, valor) values('3', 'Corazon', 3);
insert into Cartas (numero, palo, valor) values('4', 'Corazon', 4);
insert into Cartas (numero, palo, valor) values('5', 'Corazon', 5);
insert into Cartas (numero, palo, valor) values('6', 'Corazon', 6);
insert into Cartas (numero, palo, valor) values('7', 'Corazon', 7);
insert into Cartas (numero, palo, valor) values('8', 'Corazon', 8);
insert into Cartas (numero, palo, valor) values('9', 'Corazon', 9);
insert into Cartas (numero, palo, valor) values('10', 'Corazon', 10);
insert into Cartas (numero, palo, valor) values('J', 'Corazon', 10);
insert into Cartas (numero, palo, valor) values('Q', 'Corazon', 10);
insert into Cartas (numero, palo, valor) values('K', 'Corazon', 10);

insert into Cartas (numero, palo, valor) values('As', 'Pica', 11);
insert into Cartas (numero, palo, valor) values('2', 'Pica', 2);
insert into Cartas (numero, palo, valor) values('3', 'Pica', 3);
insert into Cartas (numero, palo, valor) values('4', 'Pica', 4);
insert into Cartas (numero, palo, valor) values('5', 'Pica', 5);
insert into Cartas (numero, palo, valor) values('6', 'Pica', 6);
insert into Cartas (numero, palo, valor) values('7', 'Pica', 7);
insert into Cartas (numero, palo, valor) values('8', 'Pica', 8);
insert into Cartas (numero, palo, valor) values('9', 'Pica', 9);
insert into Cartas (numero, palo, valor) values('10', 'Pica', 10);
insert into Cartas (numero, palo, valor) values('J', 'Pica', 10);
insert into Cartas (numero, palo, valor) values('Q', 'Pica', 10);
insert into Cartas (numero, palo, valor) values('K', 'Pica', 10);