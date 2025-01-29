
create database if not exists `BDdogcare`;

use BDdogcare;
create table if not exists `usuarios`(

`codUsuario` int not null default '0',
`nombre` varchar(15),
`apellido1` varchar(20),
`apellido2` varchar(20),
`correo` varchar(45),
`verificado` enum('si', 'no') default 'no',
constraint `pk_usuarios` primary key(`codUsuario`)

);

create table if not exists `clientes`(

`codCliente` int not null default '0',
`codUsuario` int,
`valoracion` decimal(2,1),
`telefono` char(9),
constraint `pk_clientes` primary key(`codCliente`),

constraint `fk_clientes_usuarios` foreign key 
(`codUsuario`) references `usuarios`(`codUsuario`)
on delete cascade
);

create table if not exists `cuidadores`(

`codCuidador` int not null default '0',
`codUsuario` int,
`descripcionCasa` varchar(500),
`descripcionCuid` varchar(500),
`direccion` varchar(50),
`telefono` char(9),
`pais` varchar(10),
`codPostal` char(5),
`fechaNacim` date,
`valoracion` decimal(2, 1),
constraint `pk_cuidadores` primary key(`codCuidador`),

constraint `fk_cuidadores_usuarios` foreign key 
(`codUsuario`) references `usuarios`(`codUsuario`)
on delete cascade
);

create table if not exists `fotos`(

`codFoto` int not null default '0',
`codUsuario` int,
`nomFoto` varchar(30),
constraint `pk_fotos` primary key(`codFoto`),

constraint `fk_fotos_usuarios` foreign key 
(`codUsuario`) references `usuarios`(`codUsuario`)
on delete cascade
);

create table if not exists `mascotas`(

`codMascota` int not null default '0',
`codCliente` int,
`tipoMascota` enum('perro', 'gato'),
`raza` varchar(20),
`fechaNacimMascota` date,
`sexo` enum('macho', 'hembra'),
`tamaño` enum('pequeño', 'mediano', 'grande'),
`esterilizado` boolean,
`sociableGatos` boolean,
`sociableNiños` boolean,
`sociablePerros` boolean,
`Observaciones` varchar(300),
`microchip` char(15),
constraint `pk_mascotas` primary key(`codMascota`),

constraint `fk_mascotas_clientes` foreign key 
(`codCliente`) references `clientes`(`codCliente`)
on delete cascade
);

create table if not exists `tiposCuidados`(

`codTipoCuidado` int not null default '0',
`descripcion` varchar(30),
constraint `pk_tiposCuidados` primary key(`codTipoCuidado`)

);

create table if not exists `diasSemana`(

`codDiaSemana` int not null default '0',
`desDia` varchar(30),
constraint `pk_diasSemana` primary key(`codDiaSemana`)

);
 
create table if not exists `calendarioDisponibilidad`(

`codDiaSemana` int,
`codCuidador` int,
`codTipoCuidado` int,
`fechaIni` varchar(30),
`fechaFin` varchar(30),
constraint `pk_calendarioDisponibilidad` primary key(`codDiaSemana`,`codCuidador`,`codTipoCuidado`),

constraint `fk_calendarioDisponibilidad_diasSemanas` 
foreign key (`codDiaSemana`) references `diasSemana`(`codDiaSemana`)
on delete cascade,
constraint `fk_calendarioDisponibilidad_cuidadores` 
foreign key (`codCuidador`) references `cuidadores`(`codCuidador`)
on delete cascade,
constraint `fk_calendarioDisponibilidad_tiposCuidados` 
foreign key (`codTipoCuidado`) references `tiposCuidados`(`codTipoCuidado`)
on delete cascade
);
 
create table if not exists `reservas`(

`codCliente` int,
`codCuidador` int,
`codTipoCuidado` int ,
`codDiaSemana` int ,
`fechaIni` varchar(30),
`fechaFin` varchar(30),
constraint `pk_reservas` primary key(`codCliente`,`codCuidador`,`codTipoCuidado`, `codDiaSemana`),

constraint `fk_reservas_clientes` 
foreign key (`codCliente`) references `clientes`(`codCliente`)
on delete no action,
constraint `fk_reservas_cuidadores` 
foreign key (`codCuidador`) references `cuidadores`(`codCuidador`)
on delete no action,
constraint `fk_reservas_tiposCuidados` 
foreign key (`codTipoCuidado`) references `tiposCuidados`(`codTipoCuidado`)
on delete no action,
constraint `fk_reservas_codDiaSemana` 
foreign key (`codDiaSemana`) references `diasSemana`(`codDiaSemana`)
on delete no action
);

create table if not exists `chats`(

`codCliente` int,
`codCuidador` int,
`texto` varchar(30),
`ordenMensaje` int(10),
constraint `pk_chats` primary key(`codCliente`,`codCuidador`),
constraint `fk_chats_clientes` foreign key(`codCliente`) references 
`clientes`(`codCliente`) on delete no action,
constraint `fk_chats_cuidadores` foreign key(`codCuidador`) references 
`cuidadores`(`codCuidador`) on delete no action
);

