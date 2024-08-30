/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Sebastian
 * Created: 10/08/2024
 */

create table persona(
identificacion varchar(12) not null	primary key unique,
nombres varchar(50) not null,
apellidos varchar(50) not null,
telefono varchar(11) not null,
email varchar(100) not null,
direccion varchar(40),
genero char not null,
tipo char not null,
clave varchar(32)
);

create table categoriaEvento(
id int auto_increment not null primary key,
nombre varchar(50) not null,
descripcion text
);

create table categoriaBoleto(
id int auto_increment not null primary key,
nombre varchar(50) not null,
descripcion text
);

create table medioDePago(
id int auto_increment not null primary key,
nombre varchar(50) not null,
descripcion text
);

create table evento(
id int auto_increment not null primary key,
nombre varchar(100) not null unique,
lugar varchar(60) not null,
fecha datetime not null,
telefono varchar(15) not null,
organizador varchar(50) not null,
boletos int not null,
foto varchar(100),
descripcion text,
idCategoriaEvento int,
foreign key (idCategoriaEvento) references categoriaEvento(id) on update cascade on delete restrict
);

create table boleto(
numero varchar(15) not null primary key unique,
idEvento int,
cantidad int,
precio int,
idMedioDePago int,
identificacionCliente varchar(12), 
idCategoriaBoleto int,
foreign key (idEvento) references evento(id) on update cascade on delete restrict,
foreign key (idMedioDePago) references medioDePago(id) on update cascade on delete restrict,
foreign key (identificacionCliente) references persona(identificacion) on update cascade on delete restrict,
foreign key (idCategoriaBoleto) references categoriaBoleto(id) on update cascade on delete restrict
);

