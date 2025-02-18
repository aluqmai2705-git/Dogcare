-- Procedimientos almacenados de las operaciones crud para la tabla Usuario
DELIMITER $$
drop procedure leerUsuario;
create procedure leerUsuario
	(in pkUsuario int)
begin
	select nombre, apellido1, apellido2, correo, verificado
    from usuarios
    where codUsuario = pkUsuario;
END $$
DELIMITER ;

drop procedure insertarUsuario;
DELIMITER $$
create procedure insertarUsuario
	(in nombre varchar(15), in apellido1 varchar(15), in apellido2 varchar(15), in correo varchar(50), in verificado enum('si', 'no'))
begin
	declare varPk int;
    declare exit handler for sqlexception
		rollback;
	start transaction;
	set varPK = (select ifnull(max(codUsuario),0)+1 from usuarios);
		insert into usuarios
			(codUsuario, nombre, apellido1, apellido2, correo, verificado)
		values
			(varPK, nombre, apellido1, apellido2, correo, verificado);
		commit;
	end $$
    delimiter ;

delimiter $$
drop procedure borrarUsuario;
create procedure borrarUsuario
	(in codUsuario int)
begin
	delete from usuario
    where codUsuario = usuarios.codUsuario;
end $$
delimiter ;

delimiter $$
drop procedure modUsuario;
	create procedure modUsuario
		(in codUsusario int, in nombre varchar(15), in apellido1 varchar(15), in apellido2 varchar(15), in correo varchar(20), in verificado enum('si', 'no'))
	begin
		update usuarios
        set usuarios.nombre = nombre, usuarios.apellido1 = apellido1, usuarios.apellido2 = apellido2, usuarios.correo = correo, usuarios.verificacion = verificacion
        where usuarios.codUsuario = codUsuario;
end $$
delimiter ;

delimiter $$
drop procedure leerTodosUsuarios;
create procedure leerTodosUsuarios
	()
begin
	select usuarios.*
    from usuarios;
end $$
delimiter ;

-- Procedimientos almacenados de las operaciones CRUD para la tabla tiposCuidados
      
delimiter $$
drop procedure leerTiposCuidados;
create procedure leerTiposCuidados
	(in codTipoCuidado int)
begin
	select codTipoCuidado, descripcion
    from tiposCuidados
    where codTipoCuidado = tiposCuidados.codTipoCuidado;
end $$
delimiter ;

delimiter $$
drop procedure borrarTiposCuidados;
create procedure borrarTiposCuidados
	(in codTipoCuidado int)
begin
	delete from tiposCuidados
    where tiposCuidados = tiposCuidado.codTiposCuidados;
end $$
delimiter ;

delimiter $$
drop procedure insertarTiposCuidados;
create procedure insertarTiposCuidados
	(in descripcion varchar(30))
begin
	declare varpk int;
   declare exit handler for sqlexception
	rollback;
	start transaction;
		set varpk = (select ifnull(max(codTipoCuidado), 0)+1 from tiposCuidados);
		insert into tiposCuidados
			(codTipoCuidado, descripcion)
		values
			(varpk, descripcion);
	commit;
end $$
delimiter ;

delimiter $$
drop procedure modTiposCuidados;
create procedure modTiposCuidados
	(in codTiposCuidados int, in descripcion varchar(30))
begin
	update tiposCuidados
    set tiposCuidados.descripcion = descripcion
    where tiposCuidados.codTipoCuidado = codTiposCuidados;
end $$
delimiter ;

delimiter $$
drop procedure leerTodosTiposCuidados;
create procedure leerTodosTiposCuidados
	()
begin
	select tiposCuidados.*
    from tiposCuidados;
end $$
delimiter ;

-- cuidador

delimiter $$
drop procedure leerCuidador;
create procedure leerCuidador
	(in pkCuidador int)
begin
	select codCuidador, codUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion
    from cuidadores
    where pkCuidador = cuidadores.codCuidador;
end $$
delimiter ;

delimiter $$
drop procedure borrarCuidador;
create procedure borrarCuidador
	(in pkCuidador int)
begin
	delete from cuidadores
    where pkCuidador = cuidadores.codCuidador;
end $$
delimiter ;

delimiter $$
drop procedure modCuidador;
create procedure modCuidador
	(in pkCuidador int, in pkUsuario int, in descripcionCasa varchar(200), in descripcionCuid varchar(200), in direccion varchar(40), in telefono char(9), in pais varchar(10), in codpostal char(5), in fechaNacim date, in valoracion decimal(2,1))
begin
	update cuidadores
    set cuidadores.codUsuario = pkUsuario, cuidadores.descripcionCasa = descripcionCasa, cuidadores.descripcionCuid=descripcionCuid, cuidadores.dirreccion =direccion, cuidadores.telefono = telefono, cuidadores.pais = pais, cuidadores.codPostal= codPostal, cuidadores.fechaNacim=fechaNacim, cuidadores.valoracion=valoracion
	where cuidadores.codCuidador = pkCuidador;
end $$
delimiter ;

delimiter $$
drop procedure insertarCuidador;
create procedure insertarCuidador
	(in pkUsuario int, in descripcionCasa varchar(200), in descripcionCuid varchar(200), in direccion varchar(40), in telefono char(9), in pais varchar(10), in codpostal char(5), in fechaNacim date, in valoracion decimal(2,1))
begin
	declare varpk int;
    declare exit handler for sqlexception
		rollback;
	start transaction;
    set varpk = (select ifnull(max(cuidadores.codCuidador), 0)+1 from tiposCuidados);
		insert into cuidadores
			(codCuidador, codUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion)
		values
			(varpk, pkUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion);
	commit;
end $$
delimiter ;

-- P
delimiter $$
drop procedure leerTodosCuidadores;
create procedure leerTodosCuidadores
	()
begin
	select cuidadores.*
    from cuidadores;
end $$
delimiter ;

-- Procedimientos almacenador de las operaciones CRUD de la tabla reserva

delimiter $$
drop procedure borrarReserva;
create procedure borrarReserva
	(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int)
begin
	delete from reservas
    where reservas.CodCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end $$
delimiter ;

-- Procedimiento para leer una reserva
delimiter $$
drop procedure leerReserva;
create procedure leerReserva
	(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int)
begin
	select codCliente, codCuidador, codTipoCuidado, codDiaSemana, fechaIni, fechaFin
    from reservas
    where reservas.codCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end $$
delimiter ;

-- Procedimiento para modificar reservas
delimiter $$
drop procedure modReserva;
create procedure modReserva
	(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int, in fechIni date, in fechFin date)
begin
	update reservas
    set reservas.fechaIni = fechIni, reservas.fechaFin = fechFin
    where reservas.CodCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end $$
delimiter ;

-- Procedimiento para insertar Reservas
delimiter $$
drop procedure insertarReserva;
create procedure insertarReserva
	(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int, in fechIni date, in fechFin date)
begin
	declare exit handler for sqlexception
		rollback;
	start transaction;
		insert into reservas
			(codCliente, codCuidador, codTipoCuidado, codDiaSemana, fechaIni, fechaFin)
		values
			(pkCliente,pkCuidador, pkTipoCuidado, pkDiaSemana, fechIni, fechFin);
	commit;
end $$
delimiter ;

-- Procedimiento para ver todas las reservas
delimiter $$
drop procedure leerTodasReservas;
create procedure leerTodasReservas
	()
begin
	select reservas.*
    from reservas;
end $$
delimiter ;

-- Procedimiento agenda para los cuidadores

delimiter $$
drop procedure agendaCuidador;

create procedure agendaCuidador
	(in fechInicio date, in fechFin date)
begin
	select reservas.fechaIni, reservas.fechaFin, reservas.codTipoCuidado, 
		   reservas.codCliente, reservas.codMascota
    from reservas
    where (reservas.fechaIni between fechInicio and fechFin) and
		  (reservas.fechaFin between fechInicio and fechFin);
end $$
delimiter ;