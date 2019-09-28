--Aprendiendo Sql en 2 semanas

--Ejercicios


--2.)Crear una tabla (create table - sp_tables - sp_Columns - drop table)

	--Primer Problema

if object_id('Agenda') is not null drop table Agenda

create table Agenda(
	Apellido varchar(30),
	Nombre varchar(20),
	Domicilio varchar(30),
	Telefono varchar(11)
)

exec sp_tables @table_owner='dbo' --Visualizando las tablas Existentes

exec sp_Columns Agenda --Visualizando la estructura de la tabla agenda

drop table Agenda --Eliminando la tabla agenda

drop table Agenda --Eliminandola sin controlar si existe (Error)


	--Segundo problema

if object_id('Libros') is not null drop table Libros

exec sp_tables @table_owner='dbo' --Visualizando las tablas Existentes

create table Libros( -- Crear tabla libros
	Titulo varchar(20),
	Autor varchar(20),
	Editorial varchar(15)
)

create table Libros( -- Crear tabla libros aparece error
	Titulo varchar(20),
	Autor varchar(20),
	Editorial varchar(15)
)

exec sp_tables @table_owner = 'dbo' --Visualizando tablas existentes

drop table Libros

drop table Libros -- Borrar sin comprobar si existe


--3.)Insertar y recuperar registros de una tabla (insert into - select) 

	--Primer problema

if object_id('Agenda') is not null
	drop table Agenda

create table Agenda( --Creando tabla agenda
	Apellido varchar(30),
	Nombre varchar (20),
	Domicilio varchar(30),
	Telefono varchar(11)
)

exec sp_tables @table_owner = 'dbo' -- Verificando tablas existentes

exec sp_columns Agenda --visualizando la estructura de la tabla

--Ingresando valores
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values ('Moreno','Alberto','Colon 123','42124132')
go
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values ('Torres','Juan','Avellaneda 231','4223442')

select *from Agenda --Seleccionando todos los registros de la tabla

drop table Agenda --Eliminando la tabla agenda

drop table Agenda --Aparece el error

	--segundo problema

if Object_id('Libros')is not null --Si la tabla libros existe borrala
	drop table Libros

create table Libros (

	Titulo varchar(20),
	Autor varchar(30),
	Editorial varchar(15)

)

exec sp_tables @table_owner = 'dbo' --Visualizando tablas existentes

exec sp_columns Libros --Visualizando estructura

--Ingresando los registros

Insert into Libros(Titulo,Autor,Editorial) values ('La celestina','Fernando de rojas','SANTILLANA');
go
Insert into Libros(Titulo,Autor,Editorial) values ('El quijote','Miguel Cervantes','VIDAL');

select *from Libros --Mostrando los datos de la tabla libro


--4.)Tipos de datos básicos

	--primer problema

if object_id('Peliculas')is not null
	drop table Peliculas

create table peliculas(
	Nombre varchar(20),
	Actor varchar(20),
	duracion integer,
	cantidad integer
)	

exec sp_columns peliculas 

--Ingresando los registros

insert into peliculas(Nombre,Actor,duracion,cantidad) values ('Titanic','Leonardo Dicaprio',160,6);
go
insert into peliculas(Nombre,Actor,duracion,cantidad) values ('Police Story','Jackie chan',123,4);
go
insert into peliculas(Nombre,Actor,duracion,cantidad) values ('Equalizer','Denzel washington',120,7);

select *from peliculas --Mostrando el registro

	--Segundo problema

if object_id('Empleados') is not null
	drop table Empleados

create table Empleados( --Creando la tabla empleados
	
	Nombre varchar(20),
	Documento varchar(8),
	Sexo varchar(1),
	Domicilio varchar(30),
	SueldoBasico float
) 

exec sp_columns Empleados --Viendo la estructura de la tabla

--Ingresando registros

insert into Empleados(Nombre,Documento,Sexo,Domicilio,SueldoBasico) values('Juan Perez','2232123','M','Sanchez 38',45000)
go
insert into Empleados(Nombre,Documento,Sexo,Domicilio,SueldoBasico) values('Maria Ramos','442345','F','Mella 39',30000)

select *from Empleados --Todo lo registrado


--5.)Recuperar algunos campos (select)

	--primer problema

if object_id('peliculas')is not null
	drop table peliculas

create table peliculas(

	Titulo varchar(20),
	Actor varchar(20),
	duracion integer,
	cantidad integer
)

exec sp_columns peliculas

--Ingresando a los registros

insert into peliculas(Titulo,Actor,duracion,cantidad) values ('Titanic','Dicaprio',160,90)
go
insert into peliculas(Titulo,Actor,duracion,cantidad) values ('Perico ripiao','Raymond Pozo',120,9)
go
insert into peliculas(Titulo,Actor,duracion,cantidad) values ('Ghost Rider','Nicolas cage',117,14)

select Titulo,Actor from peliculas --Mostrando solo los titulos y autor
go
select Titulo,duracion from peliculas --Mostrando solo los titulos y duracion
go
select Titulo,cantidad from peliculas --Mostrando solo los titulos y cantidad

	--Segundo problema

if object_id('Empleados')is not null
	drop table Empleados

create table Empleados(

	Nombre varchar(20),
	Documento varchar(8),
	Sexo varchar(1),
	Domicilio varchar(30),
	SueldoBasico float
)

exec sp_columns Empleados

--Ingresando algunos registros

insert into Empleados(Nombre,Documento,Sexo,Domicilio,SueldoBasico) values('Oliver','sdf23423','M','Sanchez 38',90000)
go
insert into Empleados(Nombre,Documento,Sexo,Domicilio,SueldoBasico) values('Maria','sd12312','F','Mella 46',40000)

select *from Empleados--Todos los datos
go
select Nombre,Documento,Domicilio from Empleados
go
select Documento,Sexo,SueldoBasico from Empleados


--6.)Recuperar algunos registros (where)

	--Primer problema

if object_id('Agenda')is not null
	drop table Agenda
	
create table Agenda(

	Apellido varchar(30),
	Nombre varchar(20),
	Domicilio varchar(30),
	Telefono varchar(11)
)		

exec sp_columns Agenda --Estructura de la tabla

--Ingresando registros

insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Fermin','Oliver','Calle Mella 45','454545');
go
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Flores','Armando','Cenovi','8094234389');
go
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Gomez','Mario','Calle Mella 45','454545');

select *from Agenda --Todos los registros


select *from Agenda
	where Nombre = 'Armando' --Seleccionar el registro donde nombre sea x

select Nombre,Domicilio from Agenda
	where Apellido = 'Gomez' --Seleccionar Nombre y domicilio del apellido x


select Nombre from Agenda --Seleccionar el nombre de las personas cuyo numero sea x
	where Telefono = '454545'

	--Segundo problema

if Object_id('Libros')is not null
	drop table Libros

create table Libros(

	Titulo varchar(20),
	Autor varchar(30),
	Editorial varchar(15)
)

exec sp_columns Libros --Viendo la estructura

--Agregando registros

insert into Libros(Titulo,Autor,Editorial) values('El quijote','Miguel Cervantes','VIDS');
go
insert into Libros(Titulo,Autor,Editorial) values('El Rio','Miguel Cervantes','Santillana');
go
insert into Libros(Titulo,Autor,Editorial) values('La celestina','Fernando Rojas','VIDS');

select *from Libros
	where Autor = 'Miguel Cervantes' --Registros cuyo autor sea miguel cervantes

select	Titulo from Libros
	where Editorial = 'VIDS'

select Editorial from Libros
	where Titulo = 'El Rio'


--7.)Operadores relacionales

	--Primer problema

if object_id('Articulos')is not null
	drop table Articulos

create table Articulos(

	Codigo integer,
	Nombre varchar(30),
	Descripcion varchar(30),
	Precio float,
	Cantidad integer
)

exec sp_columns Articulos

insert into Articulos(Codigo,Nombre,Descripcion,Precio,Cantidad) values(1,'Impresora','Dell',400.80,20)
go
insert into Articulos(Codigo,Nombre,Descripcion,Precio,Cantidad) values(2,'Impresora','Samsung',500,30)
go
insert into Articulos(Codigo,Nombre,Descripcion,Precio,Cantidad) values(3,'Monitor','Dell',1000,10)
go
insert into Articulos(Codigo,Nombre,Descripcion,Precio,Cantidad) values(4,'Teclado','Dell',400.85,40)
go
insert into Articulos(Codigo,Nombre,Descripcion,Precio,Cantidad) values(5,'Case','Dell',300,58)

select *from Articulos
	where Nombre = 'Impresora'

go

select *from Articulos
	where Precio >=400

go

select Codigo,Nombre from Articulos
	where Cantidad < 30

go

select Nombre,Descripcion from Articulos
	where Precio <> 1000

	--Segundo Problema

if object_id('peliculas')is not null
	drop table peliculas

create table peliculas(

	Titulo varchar(20),
	Actor varchar(20),
	Duracion integer,
	Cantidad integer
)

--Ingresando registros

insert into peliculas(Titulo,Actor,Duracion,Cantidad) values('Equalizer','Denzel Washington',120,4);
go
insert into peliculas(Titulo,Actor,Duracion,Cantidad) values('El titanic','Leonardo DiCaprio',80,2);
go
insert into peliculas(Titulo,Actor,Duracion,Cantidad) values('El campamento','Denzel Washington',89,4);
go
insert into peliculas(Titulo,Actor,Duracion,Cantidad) values('Rocky','Silvester Stallone',120,4)

select *from peliculas
	where Duracion < 90

select	Titulo from peliculas	
	where Actor <> 'Denzel Washington'

select Titulo,Actor,Cantidad from peliculas
	where Cantidad > 2


--8.)Borrar registros (delete)

	-- Primer Problema

if object_id('Agenda')is not null
	drop table Agenda

create table Agenda(

	Apellido varchar(20),
	Nombre varchar(30),
	Domicilio varchar(20),
	Telefono varchar(11)
)

--Ingresando registros

insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Alvares','Juan','Castillo','8095840288')
go
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Alvares','Mario','Castillo','8095840267')
go
insert into Agenda(Apellido,Nombre,Domicilio,Telefono) values('Lopez','Pedro','Villa rivas','8095840288')

delete from Agenda
	where Nombre = 'Juan'

delete from Agenda
	where Telefono = '8095840288'

select *from Agenda --Mostrando la tabla

delete from Agenda --Eliminando todos los registros

select *from Agenda --Mostrando la tabla


	--Segundo problema

if object_id('Articulos')is not null
	drop table Articulos


create table Articulos(

	Codigo integer,
	Nombre varchar(30),
	Descripcion varchar(30),
	Precio float,
	Cantidad integer
)

exec sp_columns Articulos

--Ingresando datos

 insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (1,'impresora','Epson Stylus C45',400.80,20)
 go
 insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (2,'impresora','Epson Stylus C85',500,30)
 go
 insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (3,'monitor','Samsung 14',800,10)
 go
 insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (4,'teclado','ingles Biswal',100,50)
 go
 insert into Articulos (codigo, nombre, descripcion, precio,cantidad) values (5,'teclado','español Biswal',90,50)

 delete from Articulos
	where precio >= 500
	
 delete from Articulos
	where Nombre = 'impresora'
	
 delete from Articulos
	where Codigo <> 4
	
select *from Articulos


--9.)Actualizar registros (update)

	--Primer Problema

if object_id('Agenda')is not null
	drop table Agenda


create table Agenda(

	apellido varchar(20),
	nombre varchar(30),
	domicilio varchar(20),
	telefono varchar(11)
)

 insert into Agenda (apellido,nombre,domicilio,telefono) values ('Acosta','Alberto','Colon 123','4234567')
 go
 insert into Agenda (apellido,nombre,domicilio,telefono) values ('Juarez','Juan','Avellaneda 135','4458787')
 go
 insert into Agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Maria','Urquiza 333','4545454')
 go
 insert into Agenda (apellido,nombre,domicilio,telefono) values ('Lopez','Jose','Urquiza 333','4545454')
 go
 insert into Agenda (apellido,nombre,domicilio,telefono) values ('Suarez','Susana','Gral. Paz 1234','4123456')

 --Actualizando Campos

 select *from Agenda

 update Agenda set nombre = 'Juan Jose'
	where nombre = 'Juan'

select *from Agenda

 update Agenda set telefono = '4445566'
	where telefono = '4545454'

select *from Agenda

 update Agenda set nombre = 'Juan Jose'
	where nombre = 'Juan'

select *from Agenda

	--Segundo problema

if Object_id('Libros')is not null
	drop table Libros

create table Libros(

	titulo varchar(30),
	autor varchar(30),
	editorial varchar(15),
	precio float
)

 insert into Libros (titulo, autor, editorial, precio) values ('El aleph','Borges','Emece',25.00)
 go
 insert into Libros (titulo, autor, editorial, precio) values ('Martin Fierro','Jose Hernandez','Planeta',35.50)
 go
 insert into Libros (titulo, autor, editorial, precio) values ('Aprenda PHP','Mario Molina','Emece',45.50)
 go
 insert into Libros (titulo, autor, editorial, precio) values ('Cervantes y el quijote','Borges','Emece',25)
 go
 insert into Libros (titulo, autor, editorial, precio) values ('Matematica estas ahi','Paenza','Siglo XXI',15)

 select *from Libros

 update Libros set autor = 'Adrian Paenza'
	where autor = 'Paenza'

 select *from Libros

 update Libros set autor = 'Adrian Paenza'
	where autor = 'Paenza'

 select *from Libros

 update Libros set precio = 27
	where autor = 'Mario Molina'

  select *from Libros

 update Libros set editorial = 'Emece S.A'
	where editorial = 'Emece'

  select *from Libros


--11.)Valores null (is null)

	--Primer problema

 if object_id('libros') is not null
  drop table libros

 create table libros(
  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 )

 insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece')
 go
 insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta')
 go
 insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo')
 go
 insert into libros (codigo,titulo,autor,editorial) values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')
 go
 insert into libros (codigo,titulo,autor,editorial) values (null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')

 update libros set codigo=1
  where titulo='Martin Fierro'

	--Segundo problema

   if object_id('alumnos') is not null
  drop table alumnos

 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 )

 exec sp_columns alumnos

 insert into alumnos (legajo,documento,nombre,domicilio) values('A233','22345345','Perez Mariana','Colon 234')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A567','23545345','Morales Marcos','Avellaneda 348')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A642','23545345','Gonzalez Analia','Caseros 444')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A685',null,'Miranda Carmen','Uspallata 999')


 --12.)Clave primaria

 --Primer problema

  if object_id('libros') is not null
  drop table libros

 create table libros(

  codigo int not null,
  titulo varchar(40) not null,
  autor varchar(20),
  editorial varchar(15),
  primary key(codigo)
 )

 insert into libros (codigo,titulo,autor,editorial) values (1,'El aleph','Borges','Emece')
 go
 insert into libros (codigo,titulo,autor,editorial) values (2,'Martin Fierro','Jose Hernandez','Planeta')
 go
 insert into libros (codigo,titulo,autor,editorial) values (3,'Aprenda PHP','Mario Molina','Nuevo Siglo')
 go
 insert into libros (codigo,titulo,autor,editorial) values (2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')
 go
 insert into libros (codigo,titulo,autor,editorial) values (null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')

 update libros set codigo=1
  where titulo='Martin Fierro'

  --Segundo problema

   if object_id('alumnos') is not null
  drop table alumnos

 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento),
  primary key(legajo) --No se permiten dos llaves primarias
 )

 create table alumnos(
  legajo varchar(4) not null,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 )

 exec sp_columns alumnos

 insert into alumnos (legajo,documento,nombre,domicilio) values('A233','22345345','Perez Mariana','Colon 234')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A567','23545345','Morales Marcos','Avellaneda 348')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A642','23545345','Gonzalez Analia','Caseros 444')
 go
 insert into alumnos (legajo,documento,nombre,domicilio) values('A685',null,'Miranda Carmen','Uspallata 999')

--13.)Campo con atributo Identity

	--Primer problema

 if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  codigo int identity,
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 )

 exec sp_columns medicamentos

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100)
 go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200)
 go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100);

 select * from medicamentos

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100)

 update medicamentos set codigo=5
  where nombre='Bayaspirina'

 delete from medicamentos
  where codigo=3

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100)

 select * from medicamentos

	--Segundo problema

  if object_id('peliculas') is not null
  drop table peliculas

 create table peliculas(
  codigo int identity,
  titulo varchar(40),
  actor varchar(20),
  duracion int,
  primary key(codigo)
 )

 exec sp_columns peliculas

 insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120)
 go
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180)
 go
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190)
 go
 insert into peliculas (titulo,actor,duracion) values('Mision imposible 2','Tom Cruise',120)
 go
 insert into peliculas (titulo,actor,duracion) values('La vida es bella','zzz',220)

 select * from peliculas

 update peliculas set codigo=7
  where codigo= 4

 delete from peliculas
  where titulo='La vida es bella'

 insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90)

 select * from peliculas


--14.)Otras caracteristicas con el atributo identity

	--Primer problema

if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 )

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Sertal','Roche',5.2,100)
 go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Buscapina','Roche',4.10,200)
 go
 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxidal 500','Bayer',15.60,100)

 select * from medicamentos

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(4,'Amoxilina 500','Bayer',15.60,100);

 set identity_insert medicamentos on;

 insert into medicamentos (nombre, laboratorio,precio,cantidad) values('Amoxilina 500','Bayer',15.60,100)
 go
 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad) values(10,'Amoxilina 500','Bayer',15.60,100);

 select ident_seed('medicamentos')

 select ident_incr('medicamentos')

 --Segundo problema

 if object_id('peliculas') is not null
  drop table peliculas

 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 )

 insert into peliculas (titulo,actor,duracion) values('Mision imposible','Tom Cruise',120)
 go
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la piedra filosofal','Daniel R.',180)
 go
 insert into peliculas (titulo,actor,duracion) values('Harry Potter y la camara secreta','Daniel R.',190)

 select * from peliculas

 set identity_insert peliculas on

 insert into peliculas (codigo,titulo,actor,duracion) values(20,'Mision imposible 2','Tom Cruise',120)
 go
 insert into peliculas (codigo, titulo,actor,duracion)values(80,'La vida es bella','zzz',220)

 select ident_seed('peliculas')

 select ident_incr('peliculas')

 insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90)

 set identity_insert peliculas off

 insert into peliculas (titulo,actor,duracion) values('Elsa y Fred','China Zorrilla',90)

 select * from peliculas


 --15.)truncate table

  if object_id('alumnos') is not null
  drop table alumnos

 create table alumnos(
  
  legajo int identity,
  documento varchar(8),
  nombre varchar(30),
  domicilio varchar(30)
 )

 insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234')
 go
 insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348')
 go
 insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444')
 go
 insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209')

 delete from alumnos

 insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234')
 go
 insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348')
 go
 insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444')
 go
 insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209')
 
 select * from alumnos

 truncate table alumnos

 insert into alumnos (documento,nombre,domicilio) values('22345345','Perez Mariana','Colon 234')
 go
 insert into alumnos (documento,nombre,domicilio) values('23545345','Morales Marcos','Avellaneda 348')
 go
 insert into alumnos (documento,nombre,domicilio) values('24356345','Gonzalez Analia','Caseros 444')
 go
 insert into alumnos (documento,nombre,domicilio) values('25666777','Torres Ramiro','Dinamarca 209')


 select * from alumnos

 --Segundo Problema

  if object_id('articulos') is not null
  drop table articulos

 create table articulos(

  codigo integer identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio float
 
 )

 insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C45',400.80)
 go
 insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500)

 truncate table articulos

 insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800)
 go
 insert into articulos (nombre, descripcion, precio) values ('teclado','ingles Biswal',100)
 go
 insert into articulos (nombre, descripcion, precio) values ('teclado','español Biswal',90)

 select * from articulos

 delete from articulos

 insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800)
 go
 insert into articulos (nombre, descripcion, precio) values ('teclado','ingles Biswal',100)
 go
 insert into articulos (nombre, descripcion, precio) values ('teclado','español Biswal',90)

 select * from articulos


--17.)Tipo de dato (Texto)

--Primer problema

  if object_id('autos') is not null
  drop table autos

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 )

 insert into autos values('ACD123','Fiat 128','1970',15000)
 go
 insert into autos values('ACG234','Renault 11','1990',40000)
 go
 insert into autos values('BCD333','Peugeot 505','1990',80000)
 go
 insert into autos values('GCD123','Renault Clio','1990',70000)
 go
 insert into autos values('BCC333','Renault Megane','1998',95000)
 go
 insert into autos values('BVF543','Fiat 128','1975',20000)

 select * from autos
  where modelo='1990'

--Segundo Problema

 if object_id('clientes') is not null
  drop table clientes

 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 )

 insert into clientes values('2233344','Perez','Juan','Sarmiento 980','4342345')
 go
 insert into clientes (documento,apellido,nombre,domicilio) values('2333344','Perez','Ana','Colon 234')
 go
 insert into clientes values('2433344','Garcia','Luis','Avellaneda 1454','4558877')
 go
 insert into clientes values('2533344','Juarez','Ana','Urquiza 444','4789900')

 select * from clientes
  where apellido='Perez'


--18.)Tipo de dato (Numerico)


 --Primer Problema

 if object_id('cuentas') is not null
  drop table cuentas

 create table cuentas(
	  numero int not null,
	  documento char(8),
	  nombre varchar(30),
	  saldo money,
	  primary key (numero)

 )

 insert into cuentas(numero,documento,nombre,saldo) values('1234','25666777','Pedro Perez',500000.60)
 go
 insert into cuentas(numero,documento,nombre,saldo) values('2234','27888999','Juan Lopez',-250000)
 go
 insert into cuentas(numero,documento,nombre,saldo) values('3344','27888999','Juan Lopez',4000.50)
 go
 insert into cuentas(numero,documento,nombre,saldo) values('3346','32111222','Susana Molina',1000)

 select * from cuentas
  where saldo<4000

 select numero,saldo from cuentas
  where nombre='Juan Lopez'

 select * from cuentas
  where saldo<0

 select * from cuentas
  where numero>=3000

--Segundo problema

 if object_id('empleados') is not null
  drop table empleados

 create table empleados(
  
  nombre varchar(30),
  documento char(8),
  sexo char(1),
  domicilio varchar(30),
  sueldobasico decimal(7,2),--máximo estimado 99999.99
  cantidadhijos tinyint--no superará los 255
 )

 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Juan Perez','22333444','m','Sarmiento 123',500,2)
 go
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Ana Acosta','24555666','f','Colon 134',850,0)
 go
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4)
 go
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Susana Molina','29000555','f','Salta 876',800.888,3)
 go
 insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos) values ('Marta Juarez','32444555','f','Sucre 1086',5000000,2)

 select * from empleados
  where sueldobasico>=900

 select * from empleados
  where cantidadhijos>0


--19.)Tipo de dato Fecha y hora

	--Primer problema

 if object_id('alumnos') is not null
  drop table alumnos

 create table alumnos(
  
  apellido varchar(30),
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  fechanacimiento datetime
 )

 set dateformat 'dmy'

 insert into alumnos values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972')
 go
 insert into alumnos values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972')
 go
 insert into alumnos values('Perez','Laura','26666666','Bulnes 345','03-03-91',null)
 go
 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)
 
 select * from alumnos where fechaingreso < '1-1-91'

 select * from alumnos where fechanacimiento is null

 insert into alumnos values('Rosas','Romina','28888888','Avellaneda 487','03151990',null)

 set dateformat 'mdy'

 insert into alumnos values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

 
 --20.)Ingresar algunos campos (insert into)

  if object_id('cuentas') is not null
  drop table cuentas

 create table cuentas(
  numero int identity,
  documento char(8) not null,
  nombre varchar(30),
  saldo money
 )

 insert into cuentas values (1,'25666777','Juan Perez',2500.50)
 go
 insert into cuentas values ('25666777','Juan Perez',2500.50)
 go
 insert into cuentas (documento,saldo) values ('28999777',-5500)
 go
 insert into cuentas (numero,documento,nombre,saldo) values (5,'28999777','Luis Lopez',34000)
 go
 insert into cuentas (numero,documento,nombre) values (3344,'28999777','Luis Lopez',34000)
 go
 insert into cuentas (nombre, saldo) values ('Luis Lopez',34000)

 select * from libros

 --21.)Valores por defecto

 --Primer problema

  if object_id('visitantes') is not null
  drop table visitantes

 create table visitantes(
  
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba', --palabra reservada default se usa para establecer valores por defecto para algunos campos
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 )

 exec sp_columns visitantes;

 insert into visitantes (nombre, domicilio, montocompra) values ('Susana Molina','Colon 123',59.80)
 go
 insert into visitantes (nombre, edad, ciudad, mail) values ('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com')

 select *from visitantes

 insert into visitantes values ('Marcelo Morales',38,default,default,default,'4255232','marcelomorales@hotmail.com',default);
 go
 insert into visitantes default values;

 select * from visitantes

 --Segundo problema

  if object_id('prestamos') is not null
  drop table prestamos;

 create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo datetime not null,
  fechadevolucion datetime,
  devuelto char(1) default 'n'
 );

 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion) values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18')
 go
 insert into prestamos (titulo,documento,fechaprestamo) values ('Alicia en el pais de las maravillas','23456789','2006-12-16')
 go
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion) values ('El aleph','22543987','2006-12-16','2006-08-19')
 go
 insert into prestamos (titulo,documento,fechaprestamo,devuelto) values ('Manual de geografia 5 grado','25555666','2006-12-18','s')

 select * from prestamos;

 insert into prestamos values('Manual de historia','32555666','2006-10-25',default,default)
 	
 select * from prestamos

 insert into prestamos default values


 --22.)Columnas calculadas (operadores aritméticos y de concatenación)

  if object_id ('articulos') is not null
  drop table articulos

 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 )

 insert into articulos (nombre, descripcion, precio,cantidad) values ('impresora','Epson Stylus C45',400.80,20)
 go
 insert into articulos (nombre, descripcion, precio) values ('impresora','Epson Stylus C85',500)
 go
 insert into articulos (nombre, descripcion, precio) values ('monitor','Samsung 14',800)
 go
 insert into articulos (nombre, descripcion, precio,cantidad) values ('teclado','ingles Biswal',100,50)

 update articulos set precio=precio+(precio*0.15)

 select * from articulos

 select nombre+','+descripcion
  from articulos

 update articulos set cantidad=cantidad-5
 where nombre='teclado'

 select * from articulos


 --23.)Alias

  if object_id ('libros') is not null
	drop table libros;

 create table libros(
	  codigo int identity,
	  titulo varchar(40) not null,
	  autor varchar(20) default 'Desconocido',
	  editorial varchar(20),
	  precio decimal(6,2),
	  cantidad tinyint default 0,
	  primary key (codigo)
 )

 insert into libros (titulo,autor,editorial,precio) values('El aleph','Borges','Emece',25)
 go
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 go
 insert into libros (titulo,autor,editorial,precio,cantidad) values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50)

 select titulo, autor,editorial,precio,cantidad,precio*cantidad as 'monto total' from libros

 select titulo,autor,precio,
  precio*0.1 as descuento,
  precio-(precio*0.1) as 'precio final' from libros
  where editorial='Emece';

 select titulo+'-'+autor as "Título y autor"
  from libros

--27.) Funciones para el uso de fechas y horas

 if object_id ('empleados') is not null
  drop table empleados

 create table empleados(
  nombre varchar(30) not null,
  apellido varchar(20) not null,
  documento char(8),
  fechanacimiento datetime,
  fechaingreso datetime,
  sueldo decimal(6,2),
  primary key(documento)
 )

 insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50)
 go
 insert into empleados values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309)
 go
 insert into empleados values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68)
 go
 insert into empleados values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25)
 go
 insert into empleados values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98)

 select nombre+space(1)+upper(apellido) as nombre,
  stuff(documento,1,0,'DNI Nº ') as documento,
  stuff(sueldo,1,0,'$ ') as sueldo from empleados

 select documento, stuff(ceiling(sueldo),1,0,'$ ') from empleados

 select nombre,apellido from empleados
  where datename(month,fechanacimiento)='october'

 select nombre,apellido from empleados
  where datepart(year,fechaingreso)=2000


--28.)Ordenar Registros (Order By)

 if object_id('visitas') is not null
  drop table visitas

 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fecha datetime,
  primary key(numero)
)

 insert into visitas (nombre,mail,pais,fecha) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20')
 go
 insert into visitas (nombre,mail,pais,fecha) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25')

 select * from visitas
  order by fecha desc

 select nombre,pais,datename(month,fecha)
  from visitas
 order by pais,datename(month,fecha) desc;

 select nombre,mail,
  datename(month,fecha) mes,
  datename(day,fecha) dia,
  datename(hour,fecha) hora
  from visitas
  order by 3,4,5

 select mail, pais
  from visitas
  where datename(month,fecha)='October'
  order by 2


--29.) Operadores lógicos ( and - or - not)

 if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(5,2),
  cantidad tinyint,
  primary key(codigo)

 )

 insert into medicamentos values('Sertal','Roche',5.2,100)
 go
 insert into medicamentos values('Buscapina','Roche',4.10,200)
 go
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100)
 go
 insert into medicamentos values('Paracetamol 500','Bago',1.90,200)
 go
 insert into medicamentos values('Bayaspirina','Bayer',2.10,150)
 go 
 insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250)

 select codigo,nombre
  from medicamentos
  where laboratorio='Roche' and
  precio<5

 select * from medicamentos
  where laboratorio='Roche' or
  precio<5

 select * from medicamentos
  where not laboratorio='Bayer' and
  cantidad=100

 select * from medicamentos
  where laboratorio='Bayer' and
  not cantidad=100

 delete from medicamentos
  where laboratorio='Bayer' and
  precio>10

 update medicamentos set cantidad=200
  where laboratorio='Roche' and
  precio>5

 delete from medicamentos
  where laboratorio='Bayer' or
  precio<3


  --30.)Otros Operadores Relacionales

 if object_id('peliculas') is not null
  drop table peliculas

 create table peliculas(
  codigo int identity,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion tinyint,
  primary key (codigo)
 )

 insert into peliculas values('Mision imposible','Tom Cruise',120)
 go
 insert into peliculas values('Harry Potter y la piedra filosofal','Daniel R.',null)
 go
 insert into peliculas values('Harry Potter y la camara secreta','Daniel R.',190)
 go
 insert into peliculas values('Mision imposible 2','Tom Cruise',120)
 go
 insert into peliculas values('Mujer bonita',null,120)
 go
 insert into peliculas values('Tootsie','D. Hoffman',90)
 go
 insert into peliculas (titulo) values('Un oso rojo')

 select * from peliculas
  where actor is null

 update peliculas set duracion=0
  where duracion is null

 delete from peliculas
  where actor is null and
  duracion=0

 select * from peliculas

 --31.)Otros operadores relacionales (between)

  if object_id('visitas') is not null
  drop table visitas

 create table visitas (
  numero int identity,
  nombre varchar(30) default 'Anonimo',
  mail varchar(50),
  pais varchar (20),
  fechayhora datetime,
  primary key(numero)
)

 insert into visitas (nombre,mail,pais,fechayhora) values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20')
 go
 insert into visitas (nombre,mail,pais,fechayhora) values ('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25')
 go
 insert into visitas (nombre,mail,pais) values ('Federico1','federicogarcia@xaxamail.com','Argentina')

 select * from visitas
  where fechayhora between '2006-09-12' and '2006-10-11'

 select * from visitas
  where numero between 2 and 5


 --32.)Otros operadores relacionales (IN)

  if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  primary key(codigo)
 )

 insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01')
 go
 insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01')
 go
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01')
 go
 insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01')
 go
 insert into medicamentos values('Bayaspirina','Bayer',2.10,150,'2019-12-01') 
 go
 insert into medicamentos values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01') 

 select nombre,precio from medicamentos
  where laboratorio in ('Bayer','Bago')

 select * from medicamentos
  where cantidad between 1 and 5

 select * from medicamentos
  where cantidad in (1,2,3,4,5)

 
--33.)Valores predeterminados (create default)

  if object_id ('clientes') is not null
  drop table clientes

 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual

 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 )

 create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]'

 exec sp_bindrule RG_legajo_patron,'clientes.legajo'

 create default VP_legajo_patron
  as 'AA00'

 exec sp_bindefault VP_legajo_patron,'clientes.legajo'

 create default VP_datodesconocido
  as '??'

 exec sp_bindefault VP_datodesconocido,'clientes.domicilio'

 exec sp_bindefault VP_datodesconocido,'clientes.ciudad'

 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10')
 select * from clientes

 exec sp_bindefault VP_datodesconocido,'clientes.provincia'

 create default VP_fechaactual
  as getdate()

 exec sp_bindefault VP_fechaactual,'clientes.fechaingreso'

 insert into clientes default values
 select * from clientes

 exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso'

 insert into clientes default values

 create rule RG_legajo
  as @valor like 'B%';

 exec sp_bindrule RG_legajo,'clientes.legajo'

 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10')


 --34.)Búsqueda de patrones (like - not like)

  if object_id('empleados') is not null
  drop table empleados

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  fechaingreso datetime,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 )

 insert into empleados values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50)
 go
 insert into empleados values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30)
 go
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790)
 go
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550)
 go
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70)
 go
 insert into empleados values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400)
 go
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800)

 select * from empleados
  where nombre like '%Perez%';

 select * from empleados
  where domicilio like 'Co%8%';

 select * from empleados
  where documento like '%[02468]';

 select * from empleados
  where documento like '[^13]%' and
  nombre like '%ez';

 select nombre from empleados
  where nombre like '%[yj]%';

 select nombre,seccion from empleados
  where seccion like '[SG]_______';

 select nombre,seccion from empleados
  where seccion not like '[SG]%';

 select nombre,sueldo from empleados
  where sueldo not like '%.00';

 select * from empleados
  where fechaingreso like '%1990%'


 --35.)Contar registros (count)

  if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 )

 insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01',null)
 go
 insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01',null)
 go
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null)
 go
 insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null)
 go
 insert into medicamentos values('Bayaspirina',null,2.10,null,'2019-12-01',null)
 go
 insert into medicamentos values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null) 

 select count(*)
  from medicamentos

 select count(laboratorio)
   from medicamentos

 select count(precio) as 'Con precio',
  count(cantidad) as 'Con cantidad'
  from medicamentos

 select count(precio)
  from medicamentos
  where laboratorio like 'B%'

 select count(numerolote) from medicamentos


--36.)Contar registros (count_big)  

 if object_id('medicamentos') is not null
  drop table medicamentos

 create table medicamentos(
  codigo int identity,
  nombre varchar(20),
  laboratorio varchar(20),
  precio decimal(6,2),
  cantidad tinyint,
  fechavencimiento datetime not null,
  numerolote int default null,
  primary key(codigo)
 )

 insert into medicamentos values('Sertal','Roche',5.2,1,'2015-02-01',null)
 go
 insert into medicamentos values('Buscapina','Roche',4.10,3,'2016-03-01',null)
 go
 insert into medicamentos values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null)
 go
 insert into medicamentos values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null)
 go
 insert into medicamentos values('Bayaspirina',null,2.10,null,'2019-12-01',null)
 go
 insert into medicamentos values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null)

 select count_big(*)
  from medicamentos

 select count_big(distinct laboratorio)
   from medicamentos

 select count_big(precio) as 'Con precio',
  count_big(cantidad) as 'Con cantidad'
  from medicamentos


  --37.)Funciones de agrupamiento (count - sum - min - max - avg)

  if object_id('empleados') is not null
  drop table empleados

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  primary key(documento)
 )

 insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2)
 go
 insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0)
 go
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1)
 go
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3)
 go
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0)
 go
 insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1)
 go
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3)
 go
 insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4)
 go
 insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null)

 select count(*)
  from empleados

 select count(sueldo)
  from empleados
  where seccion='Secretaria'

 select max(sueldo) as 'Mayor sueldo',
  min(sueldo) as 'Menor sueldo'
  from empleados

 select max(cantidadhijos)
  from empleados
  where nombre like '%Perez%'

 select avg(sueldo)
  from empleados;

 select avg(sueldo)
  from empleados
  where seccion='Secretaria'

 select avg(cantidadhijos)
  from empleados
  where seccion='Sistemas'


  --38.)Agrupar registros (group by)

  --Primer problema

  if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  ciudad varchar(20) default 'Cordoba',
  telefono varchar(11),
  mail varchar(30) default 'no tiene',
  montocompra decimal (6,2)
 )

 insert into visitantes values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80)
 go
 insert into visitantes values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50)
 go
 insert into visitantes values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90)
 go
 insert into visitantes (nombre, edad,sexo,telefono, mail) values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com')
 go
 insert into visitantes (nombre, ciudad, montocompra) values ('Alejandra Gonzalez','La Falda',280.50)
 go
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra) values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40)
 go
 insert into visitantes values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85)
 go
 insert into visitantes values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50)

 select ciudad, count(*)
  from visitantes
  group by ciudad

 select ciudad, count(telefono)
  from visitantes
  group by ciudad

 select sexo, sum(montocompra)
  from visitantes
  group by sexo

 select sexo,ciudad,
  max(montocompra) as mayor,
  min(montocompra) as menor
  from visitantes
  group by sexo,ciudad

 select ciudad,
  avg(montocompra) as 'promedio de compras'
  from visitantes
  group by ciudad

 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by ciudad

 select ciudad,
  count(*) as 'cantidad con mail'
  from visitantes
  where mail is not null and
  mail<>'no tiene'
  group by all ciudad

  --Segundo problema

  if object_id('empleados') is not null
  drop table empleados

 create table empleados(
  nombre varchar(30),
  documento char(8),
  domicilio varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  fechaingreso datetime,
  primary key(documento)
 )

 insert into empleados values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10')
 go
 insert into empleados values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12')
 go
 insert into empleados values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25')
 go
 insert into empleados values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25')
 go
 insert into empleados values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01')
 go
 insert into empleados values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01')
 go
 insert into empleados values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01')
 go
 insert into empleados values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01')
 go
 insert into empleados values('Andres Costa','28444555',default,'Secretaria',null,null,null)

 select seccion, count(*)
  from empleados
  group by seccion

  select seccion, avg(cantidadhijos) as 'promedio de hijos'
   from empleados
   group by seccion

 select datepart(year,fechaingreso), count(*)
  from empleados
  group by datepart(year,fechaingreso)

 select seccion, avg(sueldo) as 'promedio de sueldo'
  from empleados
  where cantidadhijos>0 and
  cantidadhijos is not null
  group by seccion

 select seccion, avg(sueldo) as 'promedio de sueldo'
  from empleados
  where cantidadhijos>0 and
  cantidadhijos is not null
  group by all seccion


  --39.)Seleccionar Grupos (Having)

  if object_id('clientes') is not null
  drop table clientes

 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  telefono varchar(11),
  primary key(codigo)
)

 insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba','null')
 go
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585')
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445')
 go
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null)
 go
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685')
 go
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525')
 go
 insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455')
 go
 insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null)
 go
 insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366')
 go
 insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745')

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia

 select ciudad, provincia,
  count(*) as cantidad
  from clientes
  group by ciudad,provincia
  having count(*)>1

 select ciudad, count(*)
  from clientes
  where domicilio like '%San Martin%'
  group by all ciudad
  having count(*)<2 and
  ciudad <> 'Cordoba'

  --Segundo Problema

   if object_id('visitantes') is not null
  drop table visitantes

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 )

 insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50)
 go
 insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40)
 go
 insert into visitantes values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25) 
 go
 insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120)
 go
 insert into visitantes values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20)
 go
 insert into visitantes values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95)
 go
 insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50)
 go
 insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240)
 go
 insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48)
 go
 insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30)

 select ciudad,sexo,
  sum(montocompra) as Total
  from visitantes
  group by ciudad,sexo
  having sum(montocompra)>50

 select ciudad, sexo,
  sum(montocompra) as 'total'
  from visitantes
  where montocompra>50 and
  telefono is not null
  group by all ciudad,sexo
  having ciudad<>'Cordoba'
  order by ciudad

 select ciudad,max(montocompra) as maximo
  from visitantes
  where domicilio is not null and
  sexo='f'
  group by all ciudad
  having max(montocompra)>50

 select ciudad,sexo, count(*) as cantidad,
  sum(montocompra) as total,
  avg(montocompra) as promedio
  from visitantes
  group by ciudad,sexo
  having avg(montocompra)>30
  order by total

--40.)Modificador del group by (with rollup)

--Primer Problema

 if object_id('clientes') is not null
  drop table clientes

 create table clientes (
  
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  estado varchar (20),
  pais varchar(20),
  primary key(codigo)
 )

 insert into clientes values ('Lopez Marcos','Colon 111', 'Cordoba','Cordoba','Argentina')
 go
 insert into clientes values ('Perez Ana','San Martin 222', 'Carlos Paz','Cordoba','Argentina')
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333', 'Carlos Paz','Cordoba','Argentina')
 go
 insert into clientes values ('Perez Luis','Sarmiento 444', 'Rosario','Santa Fe','Argentina')
 go
 insert into clientes values ('Gomez Ines','San Martin 987', 'Santa Fe','Santa Fe','Argentina')
 go
 insert into clientes values ('Gomez Ines','San Martin 666', 'Santa Fe','Santa Fe','Argentina')
 go
 insert into clientes values ('Lopez Carlos','Irigoyen 888', 'Cordoba','Cordoba','Argentina')
 go
 insert into clientes values ('Ramos Betina','San Martin 999', 'Cordoba','Cordoba','Argentina')
 go
 insert into clientes values ('Fernando Salas','Mariano Osorio 1234', 'Santiago','Region metropolitana','Chile')
 go
 insert into clientes values ('German Rojas','Allende 345', 'Valparaiso','Region V','Chile')
 go
 insert into clientes values ('Ricardo Jara','Pablo Neruda 146', 'Santiago','Region metropolitana','Chile')
 go
 insert into clientes values ('Joaquin Robles','Diego Rivera 147', 'Guadalajara','Jalisco','Mexico')

 select pais,count(*) as cantidad
  from clientes
  group by pais with rollup

 select pais,estado,
  count(*) as cantidad
  from clientes
  group by pais,estado with rollup

 select pais,estado,ciudad,
  count(*) as cantidad
  from clientes
  group by pais,estado,ciudad
  with rollup


 --Segundo problema

  if object_id('notas') is not null
  drop table notas

 create table notas(
  
  documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)
 )

 insert into notas values ('22333444','Programacion',8)
 go
 insert into notas values ('22333444','Programacion',9)
 go
 insert into notas values ('22333444','Ingles',8)
 go
 insert into notas values ('22333444','Ingles',7)
 go
 insert into notas values ('22333444','Ingles',6)
 go
 insert into notas values ('22333444','Sistemas de datos',10)
 go
 insert into notas values ('22333444','Sistemas de datos',9)
 go
 insert into notas values ('23444555','Programacion',5)
 go
 insert into notas values ('23444555','Programacion',4)
 go
 insert into notas values ('23444555','Programacion',3)
 go
 insert into notas values ('23444555','Ingles',9)
 go
 insert into notas values ('23444555','Ingles',7)
 go
 insert into notas values ('23444555','Sistemas de datos',9)
 go
 insert into notas values ('24555666','Programacion',1)
 go
 insert into notas values ('24555666','Programacion',3.5)
 go
 insert into notas values ('24555666','Ingles',4.5)
 go
 insert into notas values ('24555666','Sistemas de datos',6)

 select documento,materia,
  avg(nota) as promedio
  from notas
  group by documento,materia with rollup

 select documento,
  avg(nota) as promedio
  from notas
  group by documento with rollup

 select documento,materia,
  count(nota) as cantidad
  from notas
  group by documento,materia

 select documento,materia,
  count(nota) as cantidad
  from notas
  group by documento,materia with rollup

 select documento,
  min(nota) as minima, max(nota)as maxima
  from notas
  group by documento with rollup

 --41.)	Modificador del group by (with cube)

 --Primer problema

 if object_id('ventas') is not null
  drop table ventas

 create table ventas(
  numero int identity,
  montocompra decimal(6,2),
  tipopago char(1),--c=contado, t=tarjeta
  vendedor varchar(30),
  primary key (numero)
 )

 insert into ventas values(100.50,'c','Marisa Perez')
 go
 insert into ventas values(200,'c','Marisa Perez')
 go
 insert into ventas values(50,'t','Juan Lopez')
 go
 insert into ventas values(220,'c','Juan Lopez')
 go
 insert into ventas values(150,'t','Marisa Perez')
 go
 insert into ventas values(550.80,'c','Marisa Perez')
 go
 insert into ventas values(300,'t','Juan Lopez')
 go
 insert into ventas values(25,'c','Marisa Perez')

 select vendedor,tipopago,
  count(*) as cantidad
  from ventas
  group by vendedor,tipopago
  with rollup

 select vendedor,tipopago,
  count(*) as cantidad
  from ventas
  group by vendedor,tipopago
  with cube

 --Segundo problema

  if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  mail varchar(30) default 'no tiene',
  montocompra decimal(6,2)
 )

 insert into visitantes values ('Susana Molina',28,'f',null,'Cordoba',null,45.50)
 go
 insert into visitantes values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba',default,22.40)
 go
 insert into visitantes values ('Alberto Garcia',35,'m',default,'Alta Gracia','albertogarcia@hotmail.com',25) 
 go
 insert into visitantes values ('Teresa Garcia',33,'f',default,'Alta Gracia',default,120)
 go
 insert into visitantes values ('Roberto Perez',45,'m',null,'Cordoba','robertoperez@xaxamail.com',33.20)
 go
 insert into visitantes values ('Marina Torres',22,'f',null,'Villa Dolores',default,95)
 go
 insert into visitantes values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia','julietagomez@gmail.com',53.50)
 go
 insert into visitantes values ('Roxana Lopez',20,'f','null','Alta Gracia',default,240)
 go
 insert into visitantes values ('Liliana Garcia',50,'f','Paso 999','Cordoba',default,48)
 go
 insert into visitantes values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30)

 select sexo,ciudad,
  sum(montocompra) as total
  from visitantes
  group by sexo,ciudad
  with rollup

 select sexo,ciudad,
  sum(montocompra) as total
  from visitantes
  group by sexo,ciudad
  with cube

 select sexo,ciudad,
  avg(edad) as 'edad promedio'
  from visitantes
  where mail is not null and
  mail <>'no tiene'
  group by sexo,ciudad
  with rollup

 select sexo,ciudad,
  avg(edad) as 'edad promedio'
  from visitantes
  where mail is not null and
  mail <>'no tiene'
  group by sexo,ciudad
  with cube

--42.)Función grouping

  if object_id('empleados') is not null
  drop table empleados;

 create table empleados (
 
  documento varchar(8) not null,
  nombre varchar(30),
  sexo char(1),
  estadocivil char(1),
  seccion varchar(20),
  primary key (documento)
 )

 insert into empleados values ('22222222','Alberto Lopez','m','c','Sistemas')
 go
 insert into empleados values ('23333333','Beatriz Garcia','f','c','Administracion')
 go
 insert into empleados values ('24444444','Carlos Fuentes','m','s','Administracion')
 go
 insert into empleados values ('25555555','Daniel Garcia','m','s','Sistemas')
 go
 insert into empleados values ('26666666','Ester Juarez',null,'c','Sistemas')
 go
 insert into empleados values ('27777777','Fabian Torres',null,'s','Sistemas')
 go
 insert into empleados values ('28888888','Gabriela Lopez','f',null,'Sistemas')
 go
 insert into empleados values ('29999999','Hector Garcia','m',null,'Administracion')

 select sexo,estadocivil,
  count(*) as cantidad
  from empleados
  group by sexo,estadocivil
  with rollup

 select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with rollup

 select sexo,estadocivil,
  count(*) as cantidad,
  grouping(sexo) as 'resumen sexo',
  grouping(estadocivil) as 'resumen estado civil'
  from empleados
  group by sexo,estadocivil
  with cube


 --43.)Cláusulas compute y compute by

  if object_id('inmuebles') is not null
  drop table inmuebles
	
 create table inmuebles (
  
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),
  superficie decimal (8,2),
  monto decimal (8,2)
 )

 insert into inmuebles values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200)
 go
 insert into inmuebles values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500)
 go
 insert into inmuebles values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900)
 go
 insert into inmuebles values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000)
 go
 insert into inmuebles values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500)
 go
 insert into inmuebles values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800)
 go
 insert into inmuebles values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500)
 go
 insert into inmuebles values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200)

 select *from inmuebles
 compute avg(monto)

 select *from inmuebles
  compute avg(superficie),sum(monto)

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio,ciudad

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,ciudad

 select *from inmuebles
  order by documento
  compute sum(monto)
  compute avg(monto)
  by documento

 --44.)Registros duplicados (distinct)

  --Primer problema

  if object_id('clientes') is not null
  drop table clientes;

 create table clientes (
  codigo int identity,
  nombre varchar(30) not null,
  domicilio varchar(30),
  ciudad varchar(20),
  provincia varchar (20),
  primary key(codigo)
)

 insert into clientes values ('Lopez Marcos','Colon 111','Cordoba','Cordoba')
 go
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba')
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba')
 go
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario','Santa Fe')
 go
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba')
 go
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe')
 go
 insert into clientes values ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba')
 go
 insert into clientes values ('Lopez Carlos',null,'Cruz del Eje','Cordoba')
 go
 insert into clientes values ('Ramos Betina','San Martin 999','Cordoba','Cordoba')
 go
 insert into clientes values ('Lopez Lucas','San Martin 1010','Posadas','Misiones')

 select distinct provincia from clientes

 select count(distinct provincia) as cantidad
  from clientes

 select distinct ciudad from clientes

 select count(distinct ciudad) from clientes;

 select distinct ciudad from clientes
  where provincia='Cordoba';

 select provincia,count(distinct ciudad)
  from clientes
  group by provincia

  
--45.)Cláusula top	


 if object_id('empleados') is not null
  drop table empleados

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  estadocivil char(1),--c=casado, s=soltero,v=viudo
  seccion varchar(20)
 )

 insert into empleados values ('22222222','Alberto Lopez','c','Sistemas')
 go
 insert into empleados values ('23333333','Beatriz Garcia','c','Administracion')
 go
 insert into empleados values ('24444444','Carlos Fuentes','s','Administracion')
 go
 insert into empleados values ('25555555','Daniel Garcia','s','Sistemas')
 go
 insert into empleados values ('26666666','Ester Juarez','c','Sistemas')
 go
 insert into empleados values ('27777777','Fabian Torres','s','Sistemas')
 go
 insert into empleados values ('28888888','Gabriela Lopez',null,'Sistemas')
 go
 insert into empleados values ('29999999','Hector Garcia',null,'Administracion');

 select top 5 * from empleados

 select top 4 nombre,seccion
  from empleados
  order by seccion;

 select top 4 with ties nombre,seccion
  from empleados
  order by seccion

 select top 4 nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion

 select top 4 with ties nombre,estadocivil,seccion
  from empleados
  order by estadocivil,seccion

--47.)Clave primaria compuesta

--Primer Problema

if object_id('consultas') is not null
  drop table consultas

 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 )

 insert into consultas values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI')
 go
 insert into consultas values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI')
 go
 insert into consultas values ('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM')
 go
 insert into consultas values ('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI')
 go
 insert into consultas values ('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI')

 --Segundo problema

  if object_id('inscriptos') is not null
  drop table inscriptos;

 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  año datetime,
  matricula char(1),
  primary key(documento,deporte,año)
 );

 insert into inscriptos values ('12222222','Juan Perez','tenis','2005','s')
 go
 insert into inscriptos values ('23333333','Marta Garcia','tenis','2005','s')
 go
 insert into inscriptos values ('34444444','Luis Perez','tenis','2005','n')
 go
 insert into inscriptos values ('12222222','Juan Perez','futbol','2005','s')
 go
 insert into inscriptos values ('12222222','Juan Perez','natacion','2005','s')
 go
 insert into inscriptos values ('12222222','Juan Perez','basquet','2005','n')
 go
 insert into inscriptos values ('12222222','Juan Perez','tenis','2006','s')
 go
 insert into inscriptos values ('12222222','Juan Perez','tenis','2007','s')
 go
 insert into inscriptos values ('12222222','Juan Perez','tenis','2005','s')

 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  año='2005'


  --48.)Restriccion default

  --Primer problema

  if object_id('visitantes') is not null
  drop table visitantes

 create table visitantes(
  numero int identity,
  nombre varchar(30),
  edad tinyint,
  domicilio varchar(30),
  ciudad varchar(20),
  montocompra decimal (6,2) not null
 )

 alter table visitantes
  add constraint DF_visitantes_ciudad
  default 'Cordoba'
  for ciudad

 alter table visitantes
  add constraint DF_visitantes_montocompra
  default 0
  for montocompra

 insert into visitantes values ('Susana Molina',35,'Colon 123',default,59.80)
 insert into visitantes (nombre,edad,domicilio) values ('Marcos Torres',29,'Carlos Paz')
 insert into visitantes values ('Mariana Juarez',45,'Carlos Paz',null,23.90)

 select * from visitantes

 exec sp_helpconstraint visitantes

 alter table visitantes
  add constraint DF_visitantes_ciudad
  default 'Cordoba'
  for ciudad

 alter table visitantes
  add constraint DF_visitantes_numero
  default 0
  for numero

  --Segundo problema

  if object_id('vehiculos') is not null
  drop table vehiculos

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime
 )

 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo

 insert into vehiculos values('BVB111',default,default,null)

 select * from vehiculos

 alter table vehiculos
  add constraint DF_vehiculos_tipo2
  default 'm'
  for tipo

 alter table vehiculos
  add constraint DF_vehiculos_horallegada
  default getdate()
  for horallegada

 insert into vehiculos (patente,tipo) values('CAA258','a')

 select * from vehiculos

 exec sp_helpconstraint vehiculos

--49.)Restricción check

--Primer Problema

if object_id('empleados') is not null
  drop table empleados

 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 )

 alter table empleados
   add constraint CK_empleados_sueldo_positivo
   check (sueldo>0)

 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000)
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000)
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000)

 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000)

 delete from empleados where sueldo=6000

 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000) 

 alter table empleados
   add constraint CK_fechanacimiento_actual
   check (fechanacimiento<getdate())

 alter table empleados
   add constraint CK_empleados_seccion_lista
   check (seccion in ('Sistemas','Administracion','Contaduria'));

 alter table empleados
   add constraint CK_cantidadhijos_valores
   check (cantidadhijos between 0 and 15)

 exec sp_helpconstraint empleados

 insert into empleados values ('24444444','Carlos Fuentes','1980/02/05',2,'Administracion',-1500)
 go
 insert into empleados values ('25555555','Daniel Garcia','2007/05/05',2,'Sistemas',1550)

 update empleados set cantidadhijos=21 where documento='22222222'

 update empleados set seccion='Recursos' where documento='22222222'

 alter table empleados
   add constraint CK_seccion_letrainicial
   check (seccion like '%B')

--Segundo problema

if object_id('vehiculos') is not null
  drop table vehiculos

 create table vehiculos(
  numero int identity,
  patente char(6),
  tipo char(4),
  fechahoraentrada datetime,
  fechahorasalida datetime
 )

 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30')
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null)
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00')

 alter table vehiculos
   add constraint CK_vehiculos_patente_patron
   check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]')

 insert into vehiculos values('AB1234','auto',getdate(),null)

 alter table vehiculos
   add constraint CK_vehiculos_tipo_valores
   check (tipo in ('auto','moto'))

 update vehiculos set tipo='bici' where patente='AIC124'

 alter table vehiculos
   add constraint DF_vehiculos_tipo
   default 'bici'
   for tipo

 insert into vehiculos values('SDF134',default,null,null)

 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentrada_actual
   check (fechahoraentrada<=getdate())

 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentradasalida
   check (fechahoraentrada<=fechahorasalida)

 insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null)

 update vehiculos set fechahorasalida='2007/01/17 7:30'
   where patente='CAA258'

 exec sp_helpconstraint vehiculos

 alter table vehiculos
   add constraint DF_vehiculos_fechahoraentrada
   default getdate()
   for fechahoraentrada

 insert into vehiculos values('DFR156','moto',default,default)

 select * from vehiculos

 exec sp_helpconstraint vehiculos


 --50.)Deshabilitar restricciones (with check - nocheck)

 if object_id('empleados') is not null
  drop table empleados

 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  seccion varchar(20),
  sueldo decimal(6,2)
 )

 insert into empleados values ('22222222','Alberto Acosta','Sistemas',-10)
 insert into empleados values ('33333333','Beatriz Benitez','Recursos',3000)
 insert into empleados values ('34444444','Carlos Caseres','Contaduria',4000)

 alter table empleados
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0)

 alter table empleados
 with nocheck
 add constraint CK_empleados_sueldo_positivo
 check (sueldo>=0)

 insert into empleados values ('35555555','Daniel Duarte','Administracion',-2000)

 alter table empleados
  nocheck constraint CK_empleados_sueldo_positivo
 insert into empleados values ('35555555','Daniel Duarte','Administracion',2000)

 alter table empleados
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'))

 alter table empleados
 with nocheck
 add constraint CK_empleados_seccion_lista
 check (seccion in ('Sistemas','Administracion','Contaduria'))

 exec sp_helpconstraint empleados

 alter table empleados
  check constraint CK_empleados_sueldo_positivo

 update empleados set seccion='Recursos' where nombre='Carlos Caseres'

 alter table empleados
  nocheck constraint CK_empleados_seccion_lista
 update empleados set seccion='Recursos' where nombre='Carlos Caseres'

 --51.)Restricción primary key

 --Primer Problema

  if object_id('empleados') is not null
  drop table empleados

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 )

 insert into empleados values ('22222222','Alberto Lopez','Sistemas')
 insert into empleados values ('23333333','Beatriz Garcia','Administracion')
 insert into empleados values ('23333333','Carlos Fuentes','Administracion')

 alter table empleados
 add constraint PK_empleados_documento
 primary key(documento)
 delete from empleados
  where nombre='Carlos Fuentes'

 alter table empleados
 add constraint PK_empleados_documento
 primary key(documento)

 update empleados set documento='22222222'
  where documento='23333333'

 alter table empleados
 add constraint PK_empleados_nombre
 primary key(nombre)

 insert into empleados values(null,'Marcelo Juarez','Sistemas')

 alter table empleados
  add constraint DF_empleados_documento
  default '00000000'
  for documento

 insert into empleados (nombre,seccion) values('Luis Luque','Sistemas')

 select * from empleados

 insert into empleados (nombre,seccion) values('Ana Fuentes','Sistemas')

 exec sp_helpconstraint empleados

 --Segundo Problema

 if object_id('remis') is not null
  drop table remis

 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 )

 insert into remis values('ABC123','Renault 12','1990')
 go
 insert into remis values('DEF456','Fiat Duna','1995')

 alter table remis
 add constraint PK_remis_patente
 primary key(patente)

 alter table remis
 add constraint PK_remis_numero
 primary key(numero)

 exec sp_helpconstraint remis

 --53.)Restricción unique

 if object_id('remis') is not null
  drop table remis

 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 )

 insert into remis values('ABC123','Renault clio','1990')
 go
 insert into remis values('DEF456','Peugeot 504','1995')
 go
 insert into remis values('DEF456','Fiat Duna','1998')
 go
 insert into remis values('GHI789','Fiat Duna','1995')
 go
 insert into remis values(null,'Fiat Duna','1995')

 alter table remis
 add constraint UQ_remis_patente
 unique(patente)

 delete from remis where numero=3
 alter table remis
 add constraint UQ_remis_patente
 unique(patente)

 insert into remis values('ABC123','Renault 11','1995')
 go
 insert into remis values(null,'Renault 11','1995')

 exec sp_helpconstraint remis


 --54.) Eliminar restricciones (alter table - drop)

  if object_id('vehiculos') is not null
  drop table vehiculos

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 )

 alter table vehiculos
 add constraint CK_vehiculos_tipo
 check (tipo in ('a','m'))

 alter table vehiculos
  add constraint DF_vehiculos_tipo
  default 'a'
  for tipo

 alter table vehiculos
  add constraint CK_vehiculos_patente_patron
  check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]')

 alter table vehiculos
  add constraint PK_vehiculos_patentellegada
  primary key(patente,horallegada)

 insert into vehiculos values('SDR456','a','2005/10/10 10:10',null)
 go
 insert into vehiculos values('SDR456','m','2005/10/10 10:10',null)
 go
 insert into vehiculos values('SDR456','m','2005/10/10 12:10',null)
 go
 insert into vehiculos values('SDR111','m','2005/10/10 10:10',null)

 exec sp_helpconstraint vehiculos

 alter table vehiculos
  drop DF_vehiculos_tipo

 exec sp_helpconstraint vehiculos

 alter table vehiculos
  drop PK_vehiculos_patentellegada, CK_vehiculos_tipo

 exec sp_helpconstraint vehiculos

 --55.)	Crear y asociar reglas (create rule - sp_bindrule)

  if object_id('vehiculos') is not null
  drop table vehiculos

 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron
 if object_id ('RG_horallegada') is not null
   drop rule RG_horallegada
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2
 if object_id ('RG_menor_fechaactual') is not null
   drop rule RG_menor_fechaactual

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 )

 insert into vehiculos values ('AAA111','a','1990-02-01 08:10',null)
 go
 insert into vehiculos values ('BCD222','m','1990-02-01 08:10','1990-02-01 10:10')
 go
 insert into vehiculos values ('BCD222','m','1990-02-01 12:00',null)
 go
 insert into vehiculos values ('CC1234','a','1990-02-01 12:00',null)

 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'

 exec sp_help

 exec sp_helpconstraint vehiculos

 exec sp_bindrule RG_patente_patron,'vehiculos.patente'

 select * from empleados

 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null)

 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo'

 update vehiculos set tipo='c' where patente='AAA111'

 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m')

 exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo'

 update vehiculos set tipo='c' where patente='AAA111'

 create rule RG_menor_fechaactual
 as @fecha <= getdate()

 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horallegada'
 exec sp_bindrule RG_menor_fechaactual, 'vehiculos.horasalida'

 insert into vehiculos values ('NOP555','a','1990-02-01 10:10','1990-02-01 08:30');

 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida)

 delete from vehiculos where patente='NOP555'

 alter table vehiculos
 add constraint CK_vehiculos_llegada_salida
 check(horallegada<=horasalida)

 alter table vehiculos
 add constraint DF_vehiculos_tipo
 default 'b'
 for tipo

 insert into vehiculos values ('STU456',default,'1990-02-01 10:10','1990-02-01 15:30')

 exec sp_helpconstraint vehiculos

 --57.)Eliminar y dasasociar reglas (sp_unbindrule - drop rule)

  if object_id('vehiculos') is not null
  drop table vehiculos

 if object_id ('RG_patente_patron') is not null
   drop rule RG_patente_patron
 if object_id ('RG_vehiculos_tipo') is not null
   drop rule RG_vehiculos_tipo
 if object_id ('RG_vehiculos_tipo2') is not null
   drop rule RG_vehiculos_tipo2

 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime not null,
  horasalida datetime
 )

 create rule RG_patente_patron
 as @patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'

 exec sp_bindrule RG_patente_patron,'vehiculos.patente'

 insert into vehiculos values ('FGHIJK','a','1990-02-01 18:00',null)

 create rule RG_vehiculos_tipo
 as @tipo in ('a','m')

 exec sp_bindrule RG_vehiculos_tipo, 'vehiculos.tipo'

 insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL)

 create rule RG_vehiculos_tipo2
 as @tipo in ('a','c','m')

 exec sp_bindrule RG_vehiculos_tipo2, 'vehiculos.tipo'

 insert into vehiculos values('AAA111','c','2001-10-10 10:10',NULL)

 drop rule RG_vehiculos_tipo2

 drop rule RG_vehiculos_tipo

 drop rule RG_patente_patron

 exec sp_unbindrule 'vehiculos.patente'

 exec sp_helpconstraint vehiculos

 exec sp_help

 drop rule RG_patente_patron

 exec sp_help

 --58)Creación de índices

  if object_id('alumnos') is not null
  drop table alumnos

 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 )

 insert into alumnos values ('A123','22222222','Perez','Patricia',5.50)
 go
 insert into alumnos values ('A234','23333333','Lopez','Ana',9)
 go
 insert into alumnos values ('A345','24444444','Garcia','Carlos',8.5)
 go
 insert into alumnos values ('A348','25555555','Perez','Daniela',7.85)
 go
 insert into alumnos values ('A457','26666666','Perez','Fabian',3.2)
 go
 insert into alumnos values ('A589','27777777','Gomez','Gaston',6.90);

 create unique clustered index I_alumnos_apellido
 on alumnos(apellido)

 create clustered index I_alumnos_apellido
 on alumnos(apellido) 

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key clustered (legajo)

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key nonclustered (legajo)

 exec sp_helpindex alumnos

 exec sp_helpconstraint alumnos

 create unique nonclustered index I_alumnos_documento
 on alumnos(documento)

 insert into alumnos values ('A789','27777777','Morales','Hector',8)

 exec sp_helpindex alumnos

 create index I_alumnos_apellidonombre
  on alumnos(apellido,nombre)

 select name from sysindexes
  where name like '%alumnos%'

 alter table alumnos
  add constraint UQ_alumnos_documento
  unique (documento)

 exec sp_helpconstraint alumnos

 exec sp_helpindex alumnos

 select name from sysindexes
  where name like '%alumnos%'

 select name from sysindexes
  where name like 'I_%'

  --62.)Regenerar índices

  if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 )

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido) 

 exec sp_helpindex alumnos

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido,nombre)
  with drop_existing

 exec sp_helpindex alumnos

 alter table alumnos
  add constraint UQ_alumnos_documento
  unique nonclustered (documento)

 exec sp_helpindex alumnos

 create clustered index UQ_alumnos_documento
  on alumnos(documento)
  with drop_existing

 create nonclustered index I_alumnos_legajo
  on alumnos(legajo) 

 exec sp_helpindex alumnos

 create clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing

 exec sp_helpindex alumnos

 create nonclustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido)
  with drop_existing

 create clustered index I_alumnos_apellido
  on alumnos(apellido)
  with drop_existing

 create unique clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing

 exec sp_helpindex alumnos

 create clustered index I_alumnos_legajo
  on alumnos(legajo)
  with drop_existing

 exec sp_helpindex alumnos

 --63.)Eliminar índices

 if object_id('alumnos') is not null
  drop table alumnos;
 create table alumnos(
  legajo char(5) not null,
  documento char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  notafinal decimal(4,2)
 )

 create nonclustered index I_alumnos_apellido
  on alumnos(apellido)

 alter table alumnos
  add constraint PK_alumnos_legajo
  primary key clustered (legajo)

 exec sp_helpindex alumnos

 drop index PK_alumnos_legajo

 drop index I_alumnos_apellido

 drop index alumnos.I_alumnos_apellido

 exec sp_helpindex alumnos

 if exists (select name from sysindexes
  where name = 'I_alumnos_apellido')
   drop index alumnos.I_alumnos_apellido

 alter table alumnos
  drop PK_alumnos_legajo

 exec sp_helpindex alumnos

 --64.)Combinación interna (inner join)

 --Primer problema

 if (object_id('clientes')) is not null
   drop table clientes

 if (object_id('provincias')) is not null
   drop table provincias

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 )

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 )

 insert into provincias (nombre) values('Cordoba')
 go
 insert into provincias (nombre) values('Santa Fe')
 go
 insert into provincias (nombre) values('Corrientes')
 go
 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1)
 go
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1)
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1)
 go
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2)
 go
 insert into clientes values ('Pereyra Lucas','San Martin 555','Cruz del Eje',1)
 go
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2)
 go
 insert into clientes values ('Torres Fabiola','Alem 777','Ibera',3);

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo

 select c.nombre,domicilio,ciudad,p.nombre
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  order by p.nombre

 select c.nombre,domicilio,ciudad
  from clientes as c
  join provincias as p
  on c.codigoprovincia=p.codigo
  where p.nombre='Santa Fe'

  --Segundo Problema

 if (object_id('inscriptos')) is not null
  drop table inscriptos
 if (object_id('inasistencias')) is not null
  drop table inasistencias

 create table inscriptos(
  nombre varchar(30),
  documento char(8),
  deporte varchar(15),
  matricula char(1), --'s'=paga 'n'=impaga
  primary key(documento,deporte)
 )

 create table inasistencias(
  documento char(8),
  deporte varchar(15),
  fecha datetime
 )

 insert into inscriptos values('Juan Perez','22222222','tenis','s')
 go
 insert into inscriptos values('Maria Lopez','23333333','tenis','s')
 go
 insert into inscriptos values('Agustin Juarez','24444444','tenis','n')
 go
 insert into inscriptos values('Marta Garcia','25555555','natacion','s')
 go
 insert into inscriptos values('Juan Perez','22222222','natacion','s')
 go
 insert into inscriptos values('Maria Lopez','23333333','natacion','n')
 go
 insert into inasistencias values('22222222','tenis','2006-12-01')
 go
 insert into inasistencias values('22222222','tenis','2006-12-08')
 go
 insert into inasistencias values('23333333','tenis','2006-12-01')
 go
 insert into inasistencias values('24444444','tenis','2006-12-08')
 go
 insert into inasistencias values('22222222','natacion','2006-12-02')
 go
 insert into inasistencias values('23333333','natacion','2006-12-02')

 select nombre,insc.deporte,ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  order by nombre, insc.deporte

 select nombre,insc.deporte, ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  where insc.documento='22222222'

 select nombre,insc.deporte, ina.fecha
  from inscriptos as insc
  join inasistencias as ina
  on insc.documento=ina.documento and
  insc.deporte=ina.deporte
  where insc.matricula='s'

  --65.)Combinación externa izquierda (left join)

  if (object_id('clientes')) is not null
   drop table clientes
  if (object_id('provincias')) is not null
   drop table provincias

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 )

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 )

 insert into provincias (nombre) values('Cordoba')
 go
 insert into provincias (nombre) values('Santa Fe')
 go
 insert into provincias (nombre) values('Corrientes')
 go
 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1)
 go
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1)
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1)
 go
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2)
 go
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2)
 go
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4)
 go
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5)

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  left join clientes as c
  on codigoprovincia = p.codigo

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is not null

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by c.nombre

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo
  where p.nombre='Cordoba'


  --66.)Combinación externa derecha (right join)

  if (object_id('clientes')) is not null
   drop table clientes
  if (object_id('provincias')) is not null
   drop table provincias

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint not null,
  primary key(codigo)
 )

 create table provincias(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
 )

 insert into provincias (nombre) values('Cordoba')
 go
 insert into provincias (nombre) values('Santa Fe')
 go
 insert into provincias (nombre) values('Corrientes')
 go
 insert into clientes values ('Lopez Marcos','Colon 111','Córdoba',1)
 go
 insert into clientes values ('Perez Ana','San Martin 222','Cruz del Eje',1)
 go
 insert into clientes values ('Garcia Juan','Rivadavia 333','Villa Maria',1)
 go
 insert into clientes values ('Perez Luis','Sarmiento 444','Rosario',2)
 go
 insert into clientes values ('Gomez Ines','San Martin 666','Santa Fe',2)
 go
 insert into clientes values ('Torres Fabiola','Alem 777','La Plata',4)
 go
 insert into clientes values ('Garcia Luis','Sucre 475','Santa Rosa',5)

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo

 select c.nombre,domicilio,ciudad, p.nombre
  from clientes as c
  left join provincias as p
  on codigoprovincia = p.codigo

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is not null

 select c.nombre,domicilio,ciudad, p.nombre
  from provincias as p
  right join clientes as c
  on codigoprovincia = p.codigo
  where p.codigo is null
  order by ciudad

  --67.)Combinación externa completa (full join)

  if (object_id('deportes')) is not null
  drop table deportes;
 if (object_id('inscriptos')) is not null
  drop table inscriptos;
 create table deportes(
  codigo tinyint identity,
  nombre varchar(30),
  profesor varchar(30),
  primary key (codigo)
 )

 create table inscriptos(
  documento char(8),
  codigodeporte tinyint not null,
  matricula char(1) --'s'=paga 'n'=impaga
 )

 insert into deportes values('tenis','Marcelo Roca')
 go
 insert into deportes values('natacion','Marta Torres')
 go
 insert into deportes values('basquet','Luis Garcia')
 go
 insert into deportes values('futbol','Marcelo Roca')
 go
 insert into inscriptos values('22222222',3,'s')
 go
 insert into inscriptos values('23333333',3,'s')
 go
 insert into inscriptos values('24444444',3,'n')
 go
 insert into inscriptos values('22222222',2,'s')
 go
 insert into inscriptos values('23333333',2,'s')
 go
 insert into inscriptos values('22222222',4,'n') 
 go
 insert into inscriptos values('22222222',5,'n')

 select documento,d.nombre,matricula
  from inscriptos as i
  join deportes as d
  on codigodeporte=codigo

 select documento,d.nombre,matricula
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo

 select documento,d.nombre,matricula
  from deportes as d
  right join inscriptos as i
  on codigodeporte=codigo

 select nombre
  from deportes as d
  left join inscriptos as i
  on codigodeporte=codigo
  where codigodeporte is null

 select documento
  from inscriptos as i
  left join deportes as d
  on codigodeporte=codigo
  where codigo is null

 select documento,nombre,profesor,matricula
  from inscriptos as i
  full join deportes as d
  on codigodeporte=codigo

 --68.)Combinaciones cruzadas (cross join)

 --Primer problema

 if object_id('mujeres') is not null
  drop table mujeres
 if object_id('varones') is not null
  drop table varones
 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 )

 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 )

 insert into mujeres values('Maria Lopez','Colon 123',45)
 go
 insert into mujeres values('Liliana Garcia','Sucre 456',35)
 go
 insert into mujeres values('Susana Lopez','Avellaneda 98',41)
 go
 insert into varones values('Juan Torres','Sarmiento 755',44)
 go
 insert into varones values('Marcelo Oliva','San Martin 874',56)
 go
 insert into varones values('Federico Pereyra','Colon 234',38)
 go
 insert into varones values('Juan Garcia','Peru 333',50)

 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v

 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad>40 and
  v.edad>40

 select m.nombre,m.edad,v.nombre,v.edad
  from mujeres as m
  cross join varones as v
  where m.edad-v.edad between -10 and 10

  --Segundo Problema

   if object_id('guardias') is not null
  drop table guardias
 if object_id('tareas') is not null
  drop table tareas

 create table guardias(
  documento char(8),
  nombre varchar(30),
  sexo char(1), /* 'f' o 'm' */
  domicilio varchar(30),
  primary key (documento)
 )

 create table tareas(
  codigo tinyint identity,
  domicilio varchar(30),
  descripcion varchar(30),
  horario char(2), /* 'AM' o 'PM'*/
  primary key (codigo)
 )

 insert into guardias values('22333444','Juan Perez','m','Colon 123')
 go
 insert into guardias values('24333444','Alberto Torres','m','San Martin 567')
 go
 insert into guardias values('25333444','Luis Ferreyra','m','Chacabuco 235')
 go
 insert into guardias values('23333444','Lorena Viale','f','Sarmiento 988')
 go
 insert into guardias values('26333444','Irma Gonzalez','f','Mariano Moreno 111')
 go
 insert into tareas values('Colon 1111','vigilancia exterior','AM')
 go
 insert into tareas values('Urquiza 234','vigilancia exterior','PM')
 go
 insert into tareas values('Peru 345','vigilancia interior','AM')
 go
 insert into tareas values('Avellaneda 890','vigilancia interior','PM')

 select nombre,t.domicilio,descripcion
  from guardias
  cross join tareas as t

 select nombre,t.domicilio,descripcion
  from guardias as g
  cross join tareas as t
  where (g.sexo='f' and t.descripcion='vigilancia interior') or
  (g.sexo='m' and t.descripcion='vigilancia exterior')

  --69.)Autocombinación

  if object_id('clientes') is not null
  drop table clientes

 create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 )

 insert into clientes values('Maria Lopez','f',45,'Colon 123')
 go
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456')
 go
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98')
 go
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755')
 go
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874')
 go
 insert into clientes values('Federico Pereyra','m',38,'Colon 234')
 go
 insert into clientes values('Juan Garcia','m',50,'Peru 333')

 select cm.nombre,cm.edad,cv.nombre,cv.edad
  from clientes as cm
  cross join clientes cv
  where cm.sexo='f' and cv.sexo='m'

 select cm.nombre,cm.edad,cv.nombre,cv.edad
  from clientes as cm
  join clientes cv
  on cm.nombre<>cv.nombre
  where cm.sexo='f' and cv.sexo='m'

 select cm.nombre,cm.edad,cv.nombre,cv.edad
  from clientes as cm
  cross join clientes cv
  where cm.sexo='f' and cv.sexo='m' and
  cm.edad-cv.edad between -5 and 5

  --Segundo problema

   if object_id('equipos') is not null
  drop table equipos

 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 )

 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez')
 go
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes')
 go
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno')
 go
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte')

 select e1.nombre,e2.nombre,e1.barrio as 'sede'
  from equipos as e1
  cross join equipos as e2
  where e1.nombre<>e2.nombre

 select e1.nombre,e2.nombre,e1.barrio as 'sede'
  from equipos as e1
  join equipos as e2
  on e1.nombre<>e2.nombre

 select e1.nombre,e2.nombre,e1.barrio as 'sede'
  from equipos as e1
  cross join equipos as e2
  where e1.nombre>e2.nombre

  --70.)Combinaciones y funciones de agrupamiento

   if object_id('visitantes') is not null
  drop table visitantes;
 if object_id('ciudades') is not null
  drop table ciudades;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1) default 'f',
  domicilio varchar(30),
  codigociudad tinyint not null,
  mail varchar(30),
  montocompra decimal (6,2)
 );

 create table ciudades(
  codigo tinyint identity,
  nombre varchar(20)
 )
 
 insert into ciudades values('Cordoba')
 go
 insert into ciudades values('Carlos Paz')
 go
 insert into ciudades values('La Falda')
 go
 insert into ciudades values('Cruz del Eje')
 go
 insert into visitantes values ('Susana Molina', 35,'f','Colon 123', 1, null,59.80)
 go
 insert into visitantes values ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50)
 go
 insert into visitantes values ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90)
 go
 insert into visitantes values ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0)
 go
 insert into visitantes values ('Alejandra Garcia',28,'f',null,2,null,280.50)
 go
 insert into visitantes values ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40)
 go
 insert into visitantes values ('Mariana Juarez',33,'f',null,2,null,90)

 select c.nombre,
  count(*) as cantidad
  from ciudades as c
  join visitantes as v
  on codigociudad=c.codigo
  group by c.nombre

 select c.nombre,sexo,
  avg(montocompra) as 'promedio de compra'
  from ciudades as c
  join visitantes as v
  on codigociudad=c.codigo
  group by c.nombre,sexo

 select c.nombre,
  count(mail) as 'tienen mail'
  from ciudades as c
  join visitantes as v
  on codigociudad=c.codigo
  group by c.nombre

 select c.nombre,
  max(montocompra)
  from visitantes as v
  join ciudades as c
  on codigociudad=c.codigo
  group by c.nombre

  --71.)Combinacion de mas de dos tablas
  
 if object_id('socios') is not null
  drop table socios
 if object_id('deportes') is not null
  drop table deportes
 if object_id('inscriptos') is not null
  drop table inscriptos

 create table socios(
  documento char(8) not null, 
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 )

 create table deportes(
  codigo tinyint identity,
  nombre varchar(20),
  profesor varchar(15),
  primary key(codigo)
 )

 create table inscriptos(
  documento char(8) not null, 
  codigodeporte tinyint not null,
  anio char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,anio)
 )

 insert into socios values('22222222','Ana Acosta','Avellaneda 111')
 go
 insert into socios values('23333333','Betina Bustos','Bulnes 222')
 go
 insert into socios values('24444444','Carlos Castro','Caseros 333')
 go
 insert into socios values('25555555','Daniel Duarte','Dinamarca 44')
 go
 insert into deportes values('basquet','Juan Juarez')
 go
 insert into deportes values('futbol','Pedro Perez')
 go
 insert into deportes values('natacion','Marina Morales')
 go
 insert into deportes values('tenis','Marina Morales')
 go
 insert into inscriptos values ('22222222',3,'2006','s')
 go
 insert into inscriptos values ('23333333',3,'2006','s')
 go
 insert into inscriptos values ('24444444',3,'2006','n')
 go
 insert into inscriptos values ('22222222',3,'2005','s')
 go
 insert into inscriptos values ('22222222',3,'2007','n')
 go
 insert into inscriptos values ('24444444',1,'2006','s')
 go
 insert into inscriptos values ('24444444',2,'2006','s')
 go
 insert into inscriptos values ('26666666',0,'2006','s')

 select s.nombre,d.nombre,anio
  from deportes as d
  right join inscriptos as i
  on codigodeporte=d.codigo
  left join socios as s
  on i.documento=s.documento

 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  full join inscriptos as i
  on codigodeporte=d.codigo
  full join socios as s
  on s.documento=i.documento

 select s.nombre,d.nombre,anio,matricula
  from deportes as d
  join inscriptos as i
  on codigodeporte=d.codigo
  join socios as s
  on s.documento=i.documento
  where s.documento='22222222'