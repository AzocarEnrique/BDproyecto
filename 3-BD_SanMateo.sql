
Create table Ciudad(
idc integer,
Nombre varchar,
primary key(idc)
);

Create table Departamento(
depto integer,
primary key (depto)
);
Create table Direccion(
calle varchar(30),
numero integer,
pasaje varchar(15),
primary key(calle, numero)
);
Create table Cliente(
run varchar(12),
nombres varchar not null,
apellidos varchar not null,
F_nacimiento date not null,
primary key(run),
check(F_nacimiento<now())
);
Create table Emprendedor(
run varchar(12),
nombres varchar not null,
apellidos varchar not null,
F_nacimiento date not null,
primary key(run),
check(F_nacimiento<now())
);
Create table Categoria(
id integer,
categoria varchar,
primary key (id)
);
Create table M_pago(
id integer,
descripcion varchar,
Primary key (id)
);
Create table Monto(
M_bruto integer,
M_neto integer,
Primary key (M_bruto)
);
insert into Monto values (800),(60000),(970),(250),(12000),(700),(70000),(1200000),(400),(500),(300000);
update Monto set M_neto=M_bruto*0.81;

insert into Ciudad values (5290000,'Osorno'),(5370000,'Pto Octay'),(5380000,'Purranque'),(5360000,'Puyehue')
,(5390000,'Rio Negro'),(5400000,'San Juan de la Costa'),(5350000,'San Pablo'),(5090000,'Valdivia'),(5480000,'Pto Montt')
,(4780000,'Temuco');

insert into Direccion values ('Sra Pepa, Don Juan',540,NULL),('Pedro, Pablo',120,'Lastarrias'),('Roberto, Don Esteban',2304,NULL),('Carcara,Nadie',1550,'Corona')
,('Pepe Barria, Ezequiel',1120,NULL),('Roberto, Pablo',240,NULL),('Guajardo, Don Molina',5600,'Psje Lautaro')
,('M. Garcia, Brazil',2902,NULL),('Canada, Roberto Vazquez',3420,NULL),('Peru, Los perales',7450,NULL);

insert into Departamento values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);

insert into Cliente values ('18.153.338-7', 'Pedro Andres', 'Molina Barrios', '05-04-1995'),('19.153.356-K', 'Pedro Juan', 'Diego Arriagada', '05-12-1997')
,('20.199.290-7', 'Isahia Nanuk', 'Almog Slavko', '09-10-1999'),('17.436.234-7', 'Ken Roger', 'Smith Dustin', '12-02-1989'),('20.121.135-7', 'Tobias Willie', 'Marcus Tristram', '03-01-2000')
,('18.123.364-6', 'Leslie Randolph', 'Guy Stuart', '13-04-1996'),('18.123.451-1', 'Marina Lorayne', 'Delma Jan', '03-11-1995'),('17.146.568-8', 'Veronica Gayla', 'Kyla Stephanie', '09-05-1991')
,('19.346.586-3', 'Milton Rupert', 'Roman Bennet', '21-07-1997'),('17.325.357-6', 'Candace Jared', 'Airline Jerry', '29-10-1990');

insert into Emprendedor values ('17.555.338-7', 'Tito Garcia', 'Ferndandez Peres ', '14-06-1994'),('16.229.544-6', 'Homer Starr', 'Carey Lucius', '21-12-1986')
,('19.154.651-2', 'Darrell Vince', 'Sonia Xavier', '23-10-1998'),('19.641.394-4', 'Elisa Freddie', 'Porter Nanny', '02-01-1998'),('20.520.427-k', 'Catharine Laurence', 'Julia Fiona', '24-11-1999')
,('19.541.458-0', 'Kenya Noah', 'Annabel Cody', '23-06-1999'),('20.768.977-7', 'Errol Aletha', 'Vanessa Aloysius', '16-12-1999'),('20.657.155-1', 'Pierce Laureen', 'Cindi Lynn', '28-12-1999')
,('19.305.431-5', 'Hardy Frona', 'Oli Livvy', '28-10-1998'),('17.263.438-9', 'Wilfrid Louie', 'Zachary Sybil', '17-04-1996');

insert into Categoria values (211,'Productos, Tecnologia, Computacion'),(121,'Servicio, Servicios domesticos, Aseo'),(125,'Servicio, Servicios domesticos, Cuidado de niños')
,(134,'Servicio, Servicios profesionales, Abogado'),(132,'Servicio, Servicios profesionales, Arquitecto'),(1362,'Servicio, Servicios profesionales, Servicios de salud, Dentista')
,(213,'Productos, Tecnologia, Juegos y consolas'),(22,'Productos, Celulares'),(24,'Productos, Alimentacion'),(29,'Productos, Utiles y libreria');

insert into M_pago values (1,'PayPal'),(2,'Redcompra'),(3,'MasterCard'),(4,'Santander'),(5,'MACH'),(6,'Visa'),(7,'CityBank'),(8,'American Express'),(9,'Cheque'),(10,'Efectivo');


select * from Monto;
select * from Ciudad;
select * from Direccion;
select * from Departamento;
select * from Cliente;
select * from Emprendedor;
select * from Categoria;
select * from M_pago;


--empiezan tablas foraneas;
Create table TelefonoC(
runC varchar(12),
numero integer,
Foreign Key (runC) references Cliente(run)
ON DELETE Cascade on UPDATE Cascade,
primary key (numero)
);
Create table TelefonoE(
runE varchar(12),
numero integer,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
primary key (numero)
);
Create table CorreoC(
runC varchar(12),
email varchar,
Foreign Key (runC) references Cliente(run)
ON DELETE Cascade on UPDATE Cascade,
primary key (email)
);
Create table CorreoE(
runE varchar(12),
email varchar,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
primary key (email)
);
Create table Pag_web(
runE varchar(12),
dominio varchar,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
primary key (dominio)
);
Create table Producto(
idca integer,
id integer,
Foreign Key (idca) references Categoria(id)
ON DELETE Cascade on UPDATE Cascade,
nombre varchar,
tamano varchar,
peso decimal,
color varchar(15),
mat_principal varchar(10),
descripcion varchar,
primary key (id)
);
Create table Servicio(
idca integer,
id integer,
Foreign Key (idca) references Categoria(id)
ON DELETE Cascade on UPDATE Cascade,
nombre varchar,
tiempo integer,
restriccion_edad varchar,
descripcion varchar,
primary key (id)
);
Create table Maestro(
id integer,
Descripcion varchar,
Primary key (id)
);

insert into TelefonoC values ('18.153.338-7',910137885),('19.153.356-K',983084426 ),('20.199.290-7',981755086 ),('17.436.234-7',954687936 ),('20.121.135-7',933614341 ),('18.123.364-6',961435539 ),('18.123.451-1',913757004 )
,('17.146.568-8',929933025),('19.346.586-3',968720985),('17.325.357-6',990906645);

insert into CorreoC values ('18.153.338-7','C1@gmail.com'),('19.153.356-K','C2@gmail.com'),('20.199.290-7','C3@gmail.com'),('17.436.234-7','C4@gmail.com'),('20.121.135-7','C5@gmail.com'),('18.123.364-6','C6@gmail.com'),('18.123.451-1','C7@gmail.com')
,('17.146.568-8','C8@gmail.com'),('19.346.586-3','C9@gmail.com'),('17.325.357-6','C10@gmail.com');

insert into TelefonoE values ('17.555.338-7',964079840),('16.229.544-6',946971924),('19.154.651-2',926468671),('19.641.394-4',983930693),('20.520.427-k',930320707),('19.541.458-0',949190754),('20.768.977-7',968811540),('20.657.155-1',963785284)
,('19.305.431-5',917775934),('17.263.438-9',925603297);

insert into CorreoE values ('17.555.338-7','E1@gmail.com'),('16.229.544-6','E2@gmail.com'),('19.154.651-2','E3@gmail.com'),('19.641.394-4','E4@gmail.com'),('20.520.427-k','E5@gmail.com'),('19.541.458-0','E6@gmail.com'),('20.768.977-7','E7@gmail.com')
,('20.657.155-1','E8@gmail.com'),('19.305.431-5','E9@gmail.com'),('17.263.438-9','E10@gmail.com'),('19.305.431-5','E9v2@gmail.com');

insert into Pag_web values ('17.555.338-7','www.E1.cl'),('16.229.544-6','www.E2.cl'),('19.154.651-2','www.E3.cl'),('19.641.394-4','www.E4.cl'),('20.520.427-k','www.E5.cl'),('19.541.458-0','www.E6.cl'),('20.768.977-7','www.E7.cl')
,('20.657.155-1','www.E8.cl'),('19.305.431-5','www.E9.cl'),('17.263.438-9','www.E10.cl'),('17.263.438-9','www.E10v2.cl');

insert into Producto values (211,100211,'Teclado mecanico Razer Blackwidow','(52cm)x(34cm)',0.5,'negro','Plastico','Teclado mecanico completo con switches cherry mx'),(211,101211,'Mouse Logitech G203 Prodigy','(12cm)x(6cm)x(4cm)',0.085,'negro','Plastico','Mouse con rgb con sensor optico de gran calidad'),
(213,101213,'Joystick PS4','(16cm)x(5cm)x(10cm)',0.21,'negro','Plastico','Joystick con rgb y touchpad'),(22,102022,'Micro SD 64gb','(15mm)x(11mm)x(1mm)',0.00025,'negro','Plastico','Memoria SD de tamaño 64 gb')
,(24,103024,'Cereal Fibroso',NULL,1,'Rojo','Avena','Cereal de Avena con frutos secos'),(24,104024,'Coca-Cola',NULL,0.75,'Rojo','Bebida','Bebida gaseosa de sabor Cola'),(24,105024,'Kit-Kat',NULL,0.1,'Rojo','Chocolate','Barra de Chocolate de leche')
,(24,106024,'Harina integral',NULL,5,'Blanco','Centeno','Harina fina 100% integral de centeno'),(24,107024,'Super 8',NULL,0.29,'Negro','Chocolate','Oblea de Chocolate con crema sabor Vainilla'),(29,104029,'Regla','30cm',0.26,'Transparente','Plastico','Regla de plastico de 30cm');

insert into Servicio values (121,200121,'Hogar impeque',6,'Todas las edades','Limpieza completa del hogar en solo 6 horas'),(125,201125,'Niñera Vicky',8,'menores de 15 años','Niñera experta en comportamiento infatil'),
(134,202134,'Abogada Abigail',NULL,'Mayores de 18 años','Abogada con titulo en la universidad de Cambridge'),(134,203134,'Abogado Bjorn',NULL,'Mayores de 18 años','Abogado con titulo en la universidad de Princeton')
,(132,203132,'Monbach, Arquitectura y construccion',NULL,'Mayores de 18 años','Desde casas hasta grandes edificaciones'),(1362,201362,'Tresdent',1,'Todas las edades','Consulta sin preocupaciones y servicio comodo, eficaz y al instante')
,(1362,211362,'Dentista Ricardo',1,'Todas las edades','Certificado y con 10 años de experiencia'),(1362,221362,'Dentista Margaret',1,'Todas las edades','Excelente atencion, sin dolor y muy eficaz'),
(1362,232362,'Dentista Gerardo',1,'Todas las edades','Consulta Barata, rapida y muy buena');

insert into Maestro values (1,'Hogar impeque,2 cereal fibroso'),(2,'Hogar impeque,5 Harina integral'),(3,'2 Super 8'),(4,'1 micro SD 64gb'),(5,'Abogada Abigail, 2 Coca-Cola'),(6,'Tresdent, Monbach Arquitectura y construccion')
,(7,'4 Kit-Kat'),(8,'2 Kit-Kat');

select * from TelefonoC;
select * from CorreoC;
select * from TelefonoE;
select * from CorreoE;
select * from Pag_web;
select * from Producto;
select * from Servicio;
select * from Maestro;

--Empiezan relaciones;
Create table Dispone(
calle varchar(30),
numero integer,
depto integer,
Foreign Key (depto) references Departamento(depto)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (calle,numero) references Direccion(calle,numero)
ON DELETE Cascade on UPDATE Cascade,
primary Key(depto,calle,numero)
);
Create table Pertenece(
calle varchar(30),
numero integer,
idc integer,
Foreign Key (calle,numero) references Direccion(calle,numero)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idc) references Ciudad(idc)
ON DELETE Cascade on UPDATE Cascade,
primary key(calle,numero,idc)
);
Create table TieneC(
calle varchar(30),
numero integer,
runC varchar(12),
Foreign Key (calle,numero) references Direccion(calle,numero)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runC) references Cliente(run)
ON DELETE Cascade on UPDATE Cascade,
primary key(calle,numero,runC)
);
Create table TieneE(
calle varchar(30),
numero integer,
runE varchar(12),
Foreign Key (calle,numero) references Direccion(calle,numero)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
primary key(calle,numero,runE)
);
Create table Despacho(
calle varchar(30),
numero integer,
idM integer,
Foreign Key (calle,numero) references Direccion(calle,numero)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idM) references Maestro(id)
ON DELETE Cascade on UPDATE Cascade,
primary key(calle,numero,idM)
);
Create table Vende(
runE varchar(12),
idP integer,
Foreign Key (idP) references Producto(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
fecha_ini date,
fecha_fin date,
stock integer,
precio_original integer,
oferta_porcentaje integer,
primary key (fecha_ini,idP,runE)
);

Create table Ofrece(
runE varchar(12),
idS integer,
Foreign Key (idS) references Servicio(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
fecha_ini date,
fecha_fin date,
precio_original integer,
oferta_porcentaje integer,
primary key (fecha_ini,idS,runE)
);

Create table VentaS(
idS integer,
runE varchar(12),
runC varchar(12),
idM integer,
idMP integer,
M_bruto integer,
Foreign Key (idM) references Maestro(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runC) references Cliente(run)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idMP) references M_pago(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idS) references Servicio(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (M_bruto) references Monto(M_bruto)
ON DELETE Cascade on UPDATE Cascade,
Fecha_venta date,
primary key(idM,idS,runE)
);
Create table VentaP(
idP integer,
runE varchar(12),
runC varchar(12),
idM integer,
idMP integer,
M_bruto integer,
Foreign Key (idM) references Maestro(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runE) references Emprendedor(run)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (runC) references Cliente(run)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idMP) references M_pago(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (idP) references Producto(id)
ON DELETE Cascade on UPDATE Cascade,
Foreign Key (M_bruto) references Monto(M_bruto)
ON DELETE Cascade on UPDATE Cascade,
Cantidad integer,
Fecha_venta date,
Despacho boolean,
primary key(idM,runE)
);

insert into VentaS values (200121,'19.541.458-0','18.153.338-7',1,1,60000,'30-04-2020'),(200121,'19.541.458-0','18.153.338-7',2,5,60000,'14-05-2020'),(202134,'17.263.438-9','17.436.234-7',5,1,300000,'03-02-2020'),
(201362,'20.768.977-7','20.121.135-7',6,3,70000,'30-01-2020'),(203132,'20.657.155-1','20.121.135-7',6,3,1200000,'30-01-2020');

insert into VentaP values (103024,'19.641.394-4','18.153.338-7',1,1,800,2,'01-04-2020',TRUE),(106024,'19.641.394-4','18.153.338-7',2,5,970,5,'14-04-2020',FALSE),(107024,'19.641.394-4','19.153.356-K',3,6,250,2,'10-03-2020',TRUE)
,(102022,'19.154.651-2','20.199.290-7',4,10,12000,1,'01-02-2020',TRUE),(104024,'19.641.394-4','17.436.234-7',5,1,700,2,'03-02-2020',FALSE),(105024,'19.641.394-4','18.123.364-6',7,5,400,4,'11-05-2020',FALSE),
(105024,'19.641.394-4','17.146.568-8',8,9,400,2,'12-05-2020',FALSE);

insert into Despacho values ('Sra Pepa, Don Juan',540,1),('Carcara,Nadie',1550,3),('Roberto, Pablo',240,4);

insert into Dispone values ('Peru, Los perales',7450,1),('Peru, Los perales',7450,2),('Peru, Los perales',7450,3),('Peru, Los perales',7450,4),('Peru, Los perales',7450,5),('Peru, Los perales',7450,6),('Peru, Los perales',7450,7),
('Peru, Los perales',7450,8),('Peru, Los perales',7450,9),('Peru, Los perales',7450,10),('M. Garcia, Brazil',2902,1),('M. Garcia, Brazil',2902,2),('M. Garcia, Brazil',2902,3),('M. Garcia, Brazil',2902,4),('M. Garcia, Brazil',2902,5)
,('M. Garcia, Brazil',2902,6),('M. Garcia, Brazil',2902,7),('M. Garcia, Brazil',2902,8),('M. Garcia, Brazil',2902,9),('M. Garcia, Brazil',2902,10),('Canada, Roberto Vazquez',3420,1),('Canada, Roberto Vazquez',3420,2),('Canada, Roberto Vazquez',3420,3)
,('Canada, Roberto Vazquez',3420,4),('Canada, Roberto Vazquez',3420,5),('Canada, Roberto Vazquez',3420,6),('Canada, Roberto Vazquez',3420,7),('Canada, Roberto Vazquez',3420,8),('Canada, Roberto Vazquez',3420,9),('Canada, Roberto Vazquez',3420,10);

insert into Pertenece values ('Sra Pepa, Don Juan',540,5290000),('Pedro, Pablo',120,5290000),('Roberto, Don Esteban',2304,5390000),('Carcara,Nadie',1550,5390000)
,('Pepe Barria, Ezequiel',1120,5290000),('Roberto, Pablo',240,5290000),('Guajardo, Don Molina',5600,5290000)
,('M. Garcia, Brazil',2902,5480000),('Canada, Roberto Vazquez',3420,5380000),('Peru, Los perales',7450,5370000);

insert into TieneC values ('Sra Pepa, Don Juan',540,'18.153.338-7'),('Carcara,Nadie',1550,'19.153.356-K'),('Roberto, Pablo',240,'20.199.290-7'),('Guajardo, Don Molina',5600,'17.436.234-7')
,('M. Garcia, Brazil',2902,'20.121.135-7'),('Canada, Roberto Vazquez',3420,'18.123.364-6'),('M. Garcia, Brazil',2902,'17.146.568-8'),('Peru, Los perales',7450,'18.123.451-1'),('Peru, Los perales',7450,'19.346.586-3')
,('Canada, Roberto Vazquez',3420,'17.325.357-6');

insert into TieneE values ('Pedro, Pablo',120,'17.555.338-7'),('Roberto, Don Esteban',2304,'16.229.544-6'),('Pepe Barria, Ezequiel',1120,'19.154.651-2'),
('M. Garcia, Brazil',2902,'19.641.394-4'),('Canada, Roberto Vazquez',3420,'20.520.427-k'),('Canada, Roberto Vazquez',3420,'19.541.458-0'),('Peru, Los perales',7450,'20.768.977-7'),('M. Garcia, Brazil',2902,'20.657.155-1')
,('Peru, Los perales',7450,'19.305.431-5'),('Peru, Los perales',7450,'17.263.438-9');

insert into Vende values ('17.555.338-7',100211,'29-01-2020','31-12-2020',120,67000,0),('17.555.338-7',101211,'29-01-2020','31-12-2020',90,20000,0),('16.229.544-6',101213,'29-01-2020','31-12-2020',25,35000,0),('19.154.651-2',102022,'29-01-2020','31-12-2020',16,12000,0)
,('19.641.394-4',103024,'29-01-2020','31-12-2020',50,800,0),('19.641.394-4',104024,'29-01-2020','31-12-2020',10,700,0),('19.641.394-4',105024,'29-01-2020','31-12-2020',67,400,0)
,('19.641.394-4',106024,'29-01-2020','31-12-2020',23,970,0),('19.641.394-4',107024,'29-01-2020','31-12-2020',88,250,0),('20.520.427-k',104029,'29-01-2020','31-12-2020',30,200,0);

insert into Ofrece values ('19.541.458-0',200121,'29-01-2020','31-12-2020',60000,0),('17.263.438-9',202134,'29-01-2020','31-12-2020',300000,0),('19.305.431-5',203134,'29-01-2020','31-12-2020',317000,0)
,('20.657.155-1',203132,'29-01-2020','31-12-2020',1200000,0),('20.768.977-7',201362,'29-01-2020','31-12-2020',70000,0);
select * from VentaP;
select * from VentaS;
select * from Ofrece;
select * from Vende;
select * from Despacho;
select * from Pertenece;
select * from Dispone;
select * from TieneC;
select * from TieneE;

--consultas


--Realizar una consulta que permita determinar cuántos clientes han comprado productos por un período determinado (EJ: entre 2012 y 2014)
--modifique la fecha para (2019-2020) por los insert
Select Count(c.run)
From Cliente c, Ventap v
Where v.runC=c.run And Date_Part('year',v.fecha_venta) Between 2019 and 2020;


--Realizar una consulta que permita determinar los clientes que han comprado un determinado producto en un período determinado (EJ: entre 2012 y 2014)
--Cereal Fibroso, año 2019 y 2021, por los insert
Select Distinct c.nombres
From Cliente c, Ventap v, Producto p
Where v.runC=c.run And Date_Part('year',v.fecha_venta) Between 2019 and 2021 AND v.idP=p.id AND p.nombre='Cereal Fibroso';


--Realizar una consulta que permita listar las ciudades donde se ha realizado un determinado servicio.
-- Abogada Abigail
Select Distinct ci.nombre
From Servicio s, Cliente c, Ventas v, Ciudad ci, Tienec t, Direccion d, Pertenece p
Where s.nombre='Abogada Abigail' AND s.id=v.ids AND v.runC=c.run And c.run=t.runC And t.numero=d.numero And p.calle=d.calle And p.numero=d.numero And p.idc=ci.idc;

--Realizar una consulta que permita listar las ciudades donde se ha despachado un determinado producto.
--Micro SD 64gb
Select c.nombre
From Producto p, ventap v, maestro m, despacho d, direccion dir, Pertenece per, ciudad c
Where p.nombre='Micro SD 64gb' And p.id=v.idp And v.idm=m.id And m.id=d.idm And d.calle=dir.calle And d.numero=dir.numero And 
dir.numero=per.numero And dir.calle=per.calle And per.idc=c.idc;

--Realizar una consulta que permita determinar cuál es el producto que más se vende por vendedor.

Create or Replace View P(rune,id, num)
AS
Select D.rune, D.idp, Sum(D.c) 
from (Select rune, idp, Count(Distinct idp)*Cantidad AS c
From Ventap
Group by rune,idp,Cantidad) AS D
group by D.rune,D.idp;

Select Distinct v.rune, pr.nombre
From P, Ventap v, producto pr,(Select Distinct rune ,MAX(num)
	From P
	group by rune)AS t1
Where P.num=t1.max And P.rune=t1.rune AND P.id=pr.id And P.rune=v.rune;
Select * from P;

--Realizar una consulta que permita determinar cuál es el servicio que más se vende por vendedor.


Create or Replace View S(rune,id, num)
AS
Select rune, ids, Count(ids) 
From VentaS 
Group by rune, ids;

Select Distinct S.rune, S.id, ser.nombre From S, servicio ser,(
Select Distinct i.runE, MAX(i.Count) 
From (Select v.runE, v.ids, Count(v.ids) 
From VentaS v 
Group by v.runE, v.ids) AS i
Group by i.runE) AS J
where J.max=S.num AND J.rune=S.rune And S.id=ser.id;


--Realizar una vista que permita mostrar el total de compras y total pagado del mes actual por cliente,
--indique los clientes que han comprado más de 5 veces para asignarles un descuento.

--V1 modifique a 3 para que muestre algo
Create or Replace View total(runC,Tcompras, Tpagado)
AS
Select C.runC, SUM(C.sum1), SUM(C.sum2)
From (Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
	From (Select v.runC, Count(v.idM), v.Cantidad*m.M_neto AS total_pagado
	From Ventap v, Monto m
	Where v.M_bruto=m.M_bruto AND DATE_PART('month',v.fecha_venta)=DATE_PART('month',current_date)
	Group by v.runC,total_pagado) AS B
	Group by B.runC
	UNION
	Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
	From (Select v.runC, Count(Distinct v.idM), SUM(m.M_neto) AS total_pagado
	From Ventas v, Monto m
	Where v.M_bruto=m.M_bruto aND DATE_PART('month',v.fecha_venta)=DATE_PART('month',current_date)
	Group by v.runC) AS B
	Group by B.runC) AS C
Group by C.runC;

Select * from total;
--V2 Crear una vista que liste los servicios que no se han realizado en el último mes.

Create or Replace View noServicio(nombre)
AS
Select nombre
From Servicio
Except
Select s.nombre
From Servicio s, Ventas v
Where Date_Part('month',current_date)=Date_part('month',v.fecha_venta) AND v.ids=s.id;


--V3 Crear una vista que entregue el total de ventas del mes por artículo y por vendedor. Totalizando al vendedor.
Create or Replace View Pv2(rune, num)
AS
Select g.rune, sum(sum)
From (Select D.rune, D.idp, Sum(D.c) 
	from (Select rune, idp, Count(Distinct idp)*Cantidad AS c
	From Ventap
	Where Date_Part('month',current_date)=Date_part('month',fecha_venta)
	Group by rune,idp,Cantidad) AS D
	group by D.rune,D.idp) AS G
Group by rune;


--V4 Crear una vista que entregue el total de los pedidos por vendedor y a su vez por categorías de artículos.
--idCategoria ocupa los numeros que se usaron para el enunciado de las categorias en el pdf EmprendedoresSanMateo
Create or replace view pedidos(RunE, emprendedor, categoria, cantidad)
AS
Select u.rune, u.nombres, c.Categoria, u.count
From Categoria c,(
	Select v.rune, e.nombres, p.idca AS idCategoria, Count(v.idM)
	From Ventap v, Producto p, Emprendedor E
	Where p.id=v.idp AND v.runE=e.run
	Group by v.rune,e.nombres,p.idca
	UNION
	Select v.rune, e.nombres, s.idca AS idCategoria, Count(v.idM)
	From Ventas v, Servicio s, Emprendedor E
	Where s.id=v.ids AND v.runE=e.run
	Group by v.rune,e.nombres,s.idca) AS U
Where u.idcategoria=c.id;

--V5 Crear una vista que entregue el listado de clientes a los que un vendedor ha realizado un negocio.

Create or Replace View C_V(nombre_vendedor, nombre_cliente)
AS
Select Distinct e.nombres, c.nombres
From Ventap vp, Ventas vs, Emprendedor e, cliente c
Where (vp.runE=e.run And vp.runc=c.run) OR (vs.runE=e.run And vs.runc=c.run);

Select * From C_V;





--Diseño fisico

create index "nombreC" on Cliente using btree(nombres);
create index "nombreE" on Emprendedor using btree(nombres);
create index "idp" on Ventap using btree(idp);
create index "nombreP" on Producto using btree(nombre);
create index "nombreS" on Servicio using btree(nombre);

--select * from pg_indexes 

--seguridad
--Admin
ALTER USER postgres WITH PASSWORD 'postgres123';

--Vendedor y cliente
Create role Vendedor;
Create role Cliente;
revoke all on table Monto, Ciudad, Direccion, Departamento, Cliente, Emprendedor, Categoria, M_pago, TelefonoC, CorreoC, TelefonoE,
CorreoE, Pag_web, Producto, Servicio, Maestro, VentaP, VentaS, Ofrece, Vende, Despacho, Pertenece, Dispone, TieneC, TieneE, P, S, total, noServicio, Pv2, pedidos, C_V
From Vendedor, Cliente;

--para que puedan usar el esquema public que viene por defecto
GRANT USAGE ON SCHEMA Public TO Cliente, Vendedor;



--nombre de vendedores es su rut sin puntos, su contraseña es su rut sin puntos ni guion

select * from Emprendedor;

Create role "17555338-7" with login password '175553387' in role Vendedor;
Create role "16229544-6" with login password '162295446' in role Vendedor;
Create role "19154651-2" with login password '191546512' in role Vendedor;
Create role "19641394-4" with login password '196413944' in role Vendedor;
Create role "20520427-k" with login password '20520427k' in role Vendedor;
Create role "19541458-0" with login password '195414580' in role Vendedor;
Create role "20768977-7" with login password '207689777' in role Vendedor;
Create role "20657155-1" with login password '206571551' in role Vendedor;
Create role "19305431-5" with login password '193054315' in role Vendedor;
Create role "17263438-9" with login password '172634389' in role Vendedor;

--permisos a vendedores
Grant update, select(precio_original, oferta_porcentaje) on Ofrece to Vendedor;
Grant update, select(precio_original, oferta_porcentaje) on Vende  to Vendedor;
Grant insert, select, update, delete on Producto, Servicio to Vendedor;
Grant select on TelefonoC, CorreoC, total to Vendedor;


--nombre de clientes es su rut sin puntos, su contraseña es su rut sin puntos ni guion


Create role "18153338-7" with login password '181533387' in role Cliente;
Create role "19153356-K" with login password '19153356K' in role Cliente;
Create role "20199290-7" with login password '201992907' in role Cliente;
Create role "17436234-7" with login password '174362347' in role Cliente;
Create role "20121135-7" with login password '201211357' in role Cliente;
Create role "18123364-6" with login password '181233646' in role Cliente;
Create role "18123451-1" with login password '181234511' in role Cliente;
Create role "17146568-8" with login password '171465688' in role Cliente;
Create role "19346586-3" with login password '193465863' in role Cliente;
Create role "17325357-6" with login password '173253576' in role Cliente;
select * from Producto;

--permisos a clientes
Grant update, select, delete on Cliente to Cliente;
Grant select (nombre, Descripcion) on Producto to Cliente;
Grant select (Precio_original) on Vende to Cliente;
Grant select (oferta_porcentaje) on Vende to Cliente;
Grant select (nombres) on Emprendedor to Cliente;
Grant select (Email) on CorreoE to Cliente;
Grant select (numero) on TelefonoE to Cliente;
Grant select (Calle, numero) on TieneE to Cliente;



--funciones
create or replace function compraagnocli(in agno1 int, in agno2 int)
	returns int4 as $$
	declare
		count int4;
		contador record;
		cur cursor for Select c.run
		From Cliente c, Ventap v
		Where v.runC=c.run And Date_Part('year',v.fecha_venta) Between agno1 and agno2;
	begin
		count := 0;
		for contador in cur loop
			raise notice 'Run cliente: %',contador.run;
			count := count +1;
		end loop;
		return count;
	end; $$
	language plpgsql;

create or replace function c2(in agno1 int, in agno2 int, in pr varchar,out runC varchar,out nombre varchar)
	returns setof record as $$
	declare
		mayor int4;
		aux record;
	begin
		if (agno1 > Date_Part('year',NOW())) then
			raise exception 'No puedes superar el año actual';
		else if (agno2 > Date_Part('year',NOW())) then
			raise exception 'No puedes superar el año actual';
		else 
			if agno1 > agno2 then
				mayor:=agno1;
				agno1:=agno2;
				agno2:=mayor;
			end if;
			return query
			select distinct c.run, c.nombres From Cliente c, Ventap v, Producto p
			Where v.runC=c.run And Date_Part('year',v.fecha_venta) Between agno1 and agno2 AND v.idP=p.id AND p.nombre=pr;
		end if;
		end if;
	end; $$
language plpgsql;


create or replace function c3(in sv varchar, out idcuidad integer, out nombrecuidad varchar(20))
returns setof record as $$
	declare
	begin
		if (select nombre from servicio where sv=nombre) IS NULL then
			raise notice 'servicio no existe';
		end if;
		return query Select Distinct ci.idc, ci.nombre
		From Servicio s, Cliente c, Ventas v, Ciudad ci, Tienec t, Direccion d, Pertenece p
		Where s.nombre=sv AND s.id=v.ids AND v.runC=c.run And c.run=t.runC And t.numero=d.numero And p.calle=d.calle And p.numero=d.numero And p.idc=ci.idc;
		return; 
		end; $$
language plpgsql;


create or replace function c4(in pr varchar, out idcuidad integer, out nombrecuidad varchar(20))
returns setof record as $$
	declare
	begin
		if (select nombre from producto where pr=nombre) IS NULL then
		raise notice 'producto no existe';
		end if;
		return query select c.idc, c.nombre From Producto p, ventap v, maestro m, despacho d, direccion dir, Pertenece per, ciudad c
		Where p.nombre=pr AND p.id=v.idp And v.idm=m.id And m.id=d.idm And d.calle=dir.calle And d.numero=dir.numero And 
		dir.numero=per.numero And dir.calle=per.calle And per.idc=c.idc;
		return; 
	end; $$
language plpgsql;



create or replace function c5(out varchar, out varchar)
returns setof record as $$
	declare
		rec2 record;
	begin
		return query
		Select Distinct v.rune, pr.nombre
		From P, Ventap v, producto pr,(Select Distinct rune ,MAX(num)
		From P
		group by rune)AS t1
		Where P.num=t1.max And P.rune=t1.rune AND P.id=pr.id And P.rune=v.rune;
	end; $$
language plpgsql;

create or replace function c6(out varchar, out integer, out varchar)
returns setof record as $$
	declare
		rec1 record;
	begin
		Select v.rune, v.ids, Count(ids) as num into rec1
		From VentaS v,  Servicio s
		Group by v.rune, s.nombre, v.ids;
		return query
		Select fo.rune, fo.ids , s.nombre
		From Servicio s, (Select Distinct s.rune, s.ids
			From VentaS s, servicio ser,(Select Distinct i.runE, MAX(i.Count) 
				From (Select v.runE, v.ids, Count(v.ids) 
					From VentaS v 
					Group by v.runE, v.ids) AS i
				Group by i.runE) AS J
			where J.max=rec1.num AND J.rune=rec1.rune AND rec1.ids=ser.id) AS fo
		Where fo.ids=s.id;
	end $$
language plpgsql;


create or replace function v1(out runcliente character varying, out totalcompras numeric, out totalpagado numeric)
returns setof record as $$
	declare 	
	begin
		return query Select C.runC, SUM(C.sum1), SUM(C.sum2)
		From (Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
		From (Select v.runC, Count(v.idM), v.Cantidad*m.M_neto AS total_pagado
		From Ventap v, Monto m
		Where v.M_bruto=m.M_bruto AND DATE_PART('month',v.fecha_venta)=DATE_PART('month',current_date)
		Group by v.runC,total_pagado) AS B
		Group by B.runC
		UNION
		Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
		From (Select v.runC, Count(Distinct v.idM), SUM(m.M_neto) AS total_pagado
		From Ventas v, Monto m
		Where v.M_bruto=m.M_bruto AND DATE_PART('month',v.fecha_venta)=DATE_PART('month',current_date)
		Group by v.runC) AS B
		Group by B.runC) AS C
		Group by C.runC;
		return;
		end $$
language plpgsql;


Create or Replace function V2(out nombre varchar, out descripcion varchar)
returns setof record as $$ 
	declare
	begin
		return query 
		select s.nombre, s.descripcion from servicio s
		except 
		Select s.nombre, s.descripcion
		From Servicio s, Ventas v
		Where Date_Part('month',current_date)=Date_part('month',v.fecha_venta) AND v.ids=s.id;
	end $$
language plpgsql;



Create or Replace function V3(out rut_Emprendedor varchar,out nombre_producto varchar, out Total_producto numeric)
returns setof record as $$ 
	declare
	begin
		if(Select ids from ventas Where Date_Part('month',current_date)=Date_part('month',fecha_venta) limit 1)IS NULL then
			raise notice 'no se ha realizado ninguna venta aun';
		end if;
		return query
		Select g.rune, g.nombre, g.sum
		From (Select D.rune, D.idp, D.nombre, Sum(D.c) 
			from (Select v.rune, v.idp,p.nombre, Count(Distinct v.idp)*v.Cantidad AS c
				From Ventap v, Producto p
				Where Date_Part('month',current_date)=Date_part('month',fecha_venta) AND v.idp=p.id
				Group by rune,idp,p.nombre,v.Cantidad) AS D
			group by D.rune,D.nombre,D.idp) AS G
		Group by nombre, sum, rune;
	end $$
language plpgsql;



Create or Replace function V4(out RunE varchar, out emprendedor varchar, out categoria varchar, out cantidad Bigint)
returns setof record as $$ 
	declare
	begin
		return query
		Select u.rune, u.nombres, c.Categoria, u.count
		From Categoria c,(
			Select v.rune, e.nombres, p.idca AS idCategoria, Count(v.idM)
			From Ventap v, Producto p, Emprendedor E
			Where p.id=v.idp AND v.runE=e.run
			Group by v.rune,e.nombres,p.idca
			UNION
			Select v.rune, e.nombres, s.idca AS idCategoria, Count(v.idM)
			From Ventas v, Servicio s, Emprendedor E
			Where s.id=v.ids AND v.runE=e.run
			Group by v.rune,e.nombres,s.idca) AS U
		Where u.idcategoria=c.id;
	end $$
language plpgsql;
 
 
Create or Replace function V5(in nombreE varchar,out Nombre_Emprendedor varchar, out Nombre_Cliente varchar)
returns setof record as $$ 
	declare
	begin
		if(select nombres from emprendedor where nombreE=nombres)IS NOT NULL then
			if(select distinct i.id from (select v.idp as id from ventap v, emprendedor p
			   	where nombreE=p.nombres AND p.run=v.runE UNION
			    select v.ids as id from ventas v, emprendedor s
				where nombreE=s.nombres AND s.run=v.runE) AS i limit 1) IS NULL then
				raise exception 'este vendedor no ha hecho ventas';	 
			else 
				return query
				Select Distinct e.nombres, c.nombres
				From Ventap vp, Ventas vs, Emprendedor e, cliente c
				Where ((vp.runE=e.run And vp.runc=c.run) OR (vs.runE=e.run And vs.runc=c.run)) AND nombreE=e.nombres;
			end if;
		else
			raise exception 'no existe ese vendedor';
		end if;
	end $$
language plpgsql;

--funciones adicionales

create or replace function mneto(in b integer)
returns void as $$
	declare
	n integer;
	begin
		n:=b*0.81;
		insert into monto values (b,n);
	end $$
language plpgsql;

create or replace function textop(in b integer)
returns text as $$
	declare
	f varchar;
	can integer;
	begin
	f:= (select p.nombre) from producto p, ventap v where b=v.idm AND v.idp=p.id;
	can:= (select cantidad) from ventap where b=idm;
	return '('||can||' '|| f||')';
	end $$
language plpgsql;


create or replace function textos(in b integer)
returns text as $$
	declare
	f varchar;
	begin
	f:= (select s.nombre) from servicio s, ventas v where b=v.idm AND v.ids=s.id;
	return  '('||f||')';
	end $$
language plpgsql;

--trigger
--trigger para automatizar tabla monto
Create or replace function montotrigger()
returns trigger as $$
	declare
	begin
	if(TG_OP='DELETE') then
		return old;
	else
		if(select m_bruto from monto where new.m_bruto=m_bruto)IS NULL then
			perform mneto(new.m_bruto);
			return new;
		else
			return new;
		end if;
	end if;
	end $$
language plpgsql;


Create or replace function montotriggervo()
returns trigger as $$
	declare
	begin
	if(select m_bruto from monto where new.precio_original=m_bruto)IS NULL then
		perform mneto(new.precio_original);
		return new;
	else 
		return new;
	end if;
	end $$
language plpgsql;


CREATE TRIGGER  mtriggers
before INSERT OR UPDATE or DELETE ON ventas
FOR EACH ROW EXECUTE PROCEDURE montotrigger();

CREATE TRIGGER  mtriggerp
before INSERT OR UPDATE or DELETE ON ventap
FOR EACH ROW EXECUTE PROCEDURE montotrigger();

CREATE TRIGGER  mtriggero
before INSERT OR UPDATE ON ofrece
FOR EACH ROW EXECUTE PROCEDURE montotriggervo();

CREATE TRIGGER  mtriggero
before INSERT OR UPDATE ON vende
FOR EACH ROW EXECUTE PROCEDURE montotriggervo();


--trigger para automatizar tabla maestro y prevenir error de boleta duplicada
Create or replace function maestroupdp()
returns trigger as $$
	declare
	r text;
	newdescripcion text;
	begin
	if(TG_OP='INSERT') then
		if(select count(runC) from ventap where new.idm=idm AND new.runC=runC)<2 then
			if(select id from maestro where id=new.idm) is NOT NULL then
				r:=(select descripcion) from maestro where new.idm=id;
				if(select descripcion from maestro where id=new.idm)IS NULL then
					newdescripcion:=textop(new.idm);
				else 
					newdescripcion:=r ||',' ||textop(new.idm);
				end if;
				update Maestro set descripcion=newdescripcion where id=new.idm;
				return new;
			else
				raise exception 'boleta ocupada';
			end if;
		else
			raise exception 'esta boleta ya fue utilizada';
		end if;
	elsif(TG_OP='DELETE') then
		delete from maestro where id=old.idm;
		return old;
	end if;
	end $$
language plpgsql;

Create or replace function maestrollenadop()
returns trigger as $$
	declare
	begin
		if(select id from maestro where new.idm=id)IS NULL then
			insert into Maestro values (new.idm,textop(new.idm));
			return new;
		else 
			return new;
		end if;
	end $$
language plpgsql;


Create or replace function maestroupds()
returns trigger as $$
	declare
	r text;
	newdescripcion text;
	begin
	if(TG_OP='INSERT') then
		if(select count(runC) from ventas where new.idm=idm AND new.runC=runC)<2 then
			if(select id from maestro where id=new.idm) is NOT NULL then
				r:=(select descripcion) from maestro where new.idm=id;
				if(select descripcion from maestro where id=new.idm)IS NULL then
					newdescripcion:=textos(new.idm);
				else 
					newdescripcion:=r ||',' ||textos(new.idm);
				end if;
				update Maestro set descripcion=newdescripcion where id=new.idm;
				return new;
				else
				raise exception 'boleta ocupada';
			end if;
		else
			raise exception 'esta boleta ya fue utilizada';
		end if;
	elsif(TG_OP='DELETE') then
		delete from maestro where id=old.idm;
		return old;
	end if;
	end $$
language plpgsql;

Create or replace function maestrollenados()
returns trigger as $$
	declare
	begin
		if(select id from maestro where new.idm=id)IS NULL then
			insert into Maestro values (new.idm,textos(new.idm));
			return new;
		else 
			return new;
		end if;
	end $$
language plpgsql;

CREATE TRIGGER  ms
after INSERT or DELETE ON ventas
FOR EACH ROW EXECUTE PROCEDURE maestroupds();

CREATE TRIGGER  mp
after INSERT or DELETE ON ventap
FOR EACH ROW EXECUTE PROCEDURE maestroupdp();

CREATE TRIGGER  msn
before INSERT ON ventas
FOR EACH ROW EXECUTE PROCEDURE maestrollenados();

CREATE TRIGGER  mpn
before INSERT ON ventap
FOR EACH ROW EXECUTE PROCEDURE maestrollenadop();

--triggers tarea


--Si un cliente tiene mas de 3 compras en el mes a un mismo Emprendedor, 
--generar un descuento automatico del 10 % con un incremento de un 1 % para cada compra siguiente

Create or replace function trg1()
returns trigger as $$
	declare
		agno integer;
		mes integer;
		compras integer;
		descuento integer;
		i integer;
	begin
		i:=3;
		descuento:=10;
		agno:= (select DATE_PART('year',new.fecha_venta));
		mes:= (select DATE_PART('month',new.fecha_venta));
		compras:= (select count(i.idm))
				from (select runE, runC, idm from ventap
						where DATE_PART('year',current_date)=agno AND DATE_PART('month',current_date)=mes
						AND runC=new.runC AND runE=new.runE
						UNION
						select runE, runC, idm from ventas
						where DATE_PART('year',current_date)=agno AND DATE_PART('month',current_date)=mes
						AND runC=new.runC AND runE=new.runE) AS i;
--el before hace que tome uno menos, por lo que tengo que contar del 2
		if (compras>=2) then
			while(i<compras+1) loop
				descuento=descuento+1;
				i=i+1;
			end loop;
			new.m_bruto=new.m_bruto-((descuento*new.m_bruto)/100);
			return new;
		else 
			return new;
		end if;
	end $$
language plpgsql;


CREATE TRIGGER  clienterecurrente
after INSERT ON ventap
FOR EACH ROW EXECUTE PROCEDURE trg1();

CREATE TRIGGER  clienterecurrente
after INSERT ON ventas
FOR EACH ROW EXECUTE PROCEDURE trg1();


--Hacer que el sistema tome el valor de oferta vigente del
--producto o servicio elegido si es que existe alguno vigente


Create or replace function trg2p()
returns trigger as $$
	declare
	oferta integer;
	oferta_aplicada integer;
	begin
		oferta:=(select oferta_porcentaje) from vende where new.idp=idp;
		oferta_aplicada:=new.m_bruto-((oferta*new.m_bruto)/100);
		if(oferta=0) then
			return new;
		elsif(oferta>0 AND oferta<100) then
			if(select m_bruto from monto where oferta_aplicada=m_bruto)IS NULL then
				perform mneto(oferta_aplicada);
			end if;
			new.m_bruto=oferta_aplicada;
			return new;
		elsif(oferta>100)then
			raise exception 'oferta sobre el cien por ciento';
		end if;
	end $$
language plpgsql;


Create or replace function trg2s()
returns trigger as $$
	declare
	oferta integer;
	oferta_aplicada integer;
	begin
		oferta:=(select oferta_porcentaje) from ofrece where new.ids=ids;
		oferta_aplicada:=new.m_bruto-((oferta*new.m_bruto)/100);
		if(oferta=0) then
			return new;
		elsif(oferta>0 AND oferta<100) then
			if(select m_bruto from monto where oferta_aplicada=m_bruto)IS NULL then
				perform mneto(oferta_aplicada);
			end if;
			new.m_bruto=new.m_bruto-((oferta*new.m_bruto)/100);
			update ofrece set fecha_ini=current_date;
			return new;
		elsif(oferta>100)then
			raise exception 'oferta sobre el cien por ciento';
		end if;
	end $$
language plpgsql;

CREATE TRIGGER  ofertaplicada
after INSERT ON ventas
FOR EACH ROW EXECUTE PROCEDURE trg2s();

CREATE TRIGGER  ofertaplicada
after INSERT ON ventap
FOR EACH ROW EXECUTE PROCEDURE trg2p();

--Si el cliente publica una nueva oferta, el sistema debe terminar la oferta anterior de ese producto o servicio
--siempre que se encuentre vigente alguna.

Create or replace function trg3p()
returns trigger as $$
	declare
	begin
		if(old.oferta_porcentaje=0) then
			return new;
		else 
			old.oferta_porcentaje=0;
			return new;
		end if;
	end $$
language plpgsql;


Create or replace function trg3s()
returns trigger as $$
	declare
	begin
		if(old.oferta_porcentaje=0) then
			return new;
		else 
			old.oferta_porcentaje=0;
			Raise notice 'Oferta anterior terminada';
			return new;
		end if;
	end $$
language plpgsql;


CREATE TRIGGER  ofertap
before update ON vende
FOR EACH ROW EXECUTE PROCEDURE trg3p();

CREATE TRIGGER  ofertas
before update ON ofrece
FOR EACH ROW EXECUTE PROCEDURE trg3s();


--Evitar registrar a un cliente si este no tiene mas de 18 agnos

Create or replace function trg4()
returns trigger as $$
	declare
	agno integer;
	begin
	agno:= (select DATE_PART('year',age(new.f_nacimiento)));
	if (agno<18) then
		raise exception 'tienes que ser mayor de 18 para registrarte';
	else 
		return new;
	end if;
	end $$
language plpgsql;

CREATE TRIGGER  underage
after INSERT ON cliente
FOR EACH ROW EXECUTE PROCEDURE trg4();


--Al realizarse una venta, el stock del producto debe disminuir.
Create or replace function trg5()
returns trigger as $$
	declare
	res integer;
	begin
	res:=new.cantidad-old.cantidad;
	if(TG_OP='INSERT') then
		update vende set stock=stock-new.cantidad where new.idp=idp AND new.rune=rune;
		return new;
	elsif (TG_OP='UPDATE') then 
		update vende set stock=stock-res where new.idp=idp AND new.rune=rune;
		return new;
	elsif (TG_OP='DELETE') then
		if(current_date=old.fecha_venta) then
			update vende set stock=stock+old.cantidad where old.idp=idp AND old.rune=rune;
			return old;
		else
			return old;
		end if;
	end if;
	end $$
language plpgsql;

CREATE TRIGGER  controlstock
before INSERT or UPDATE or DELETE ON ventap
FOR EACH ROW EXECUTE PROCEDURE trg5();


--Evitar que un emprendedor se venda a si mismo algun producto o servicio
Create or replace function trg6()
returns trigger as $$
	declare
	begin
		if(new.runE=new.runC) then
			raise exception 'un emprendedor no se puede vender un producto a si mismo';
		else
			return new;
		end if;
	end $$
language plpgsql;

CREATE TRIGGER  ventamalap
after INSERT OR UPDATE ON ventap
FOR EACH ROW EXECUTE PROCEDURE trg6();

CREATE TRIGGER  ventamalas
after INSERT OR UPDATE ON ventas
FOR EACH ROW EXECUTE PROCEDURE trg6();




--funciones parte 3.2
--Ingresar/editar/eliminar clientes

--select insertcliente('20.333.333-3','p','c','20-06-1998','Osorno','d',23,'f',123,'a');
Create or replace function insertcliente(in runc varchar, in nombres varchar, in apellidos varchar, in f_nacimiento date, in nCiudad varchar, in ncalle varchar, in num_Casa integer,
										in pasaje varchar, in num_telefono integer, in correo varchar)
returns void as $$ declare
	cidc integer;
	begin
	cidc:=(select idc) from ciudad where nCiudad=nombre;
	if(select run from cliente where runc=run) IS NOT NULL then 
		raise exception 'este rut ya esta registrado';
	elseif(select numero from telefonoc where num_telefono=numero) IS NOT NULL then 
		raise exception 'este telefono ya esta registrado';
	elseif(select email from correoc where correo=email) IS NOT NULL then 
		raise exception 'este correo ya esta registrado';
	elseif(select nombre from ciudad where nCiudad=nombre) IS NULL then 
		raise exception 'esta ciudad no esta dentro del rango de envios';
	else
		insert into cliente values (runc,nombres,apellidos,f_nacimiento);
		insert into telefonoc values (runc,num_telefono);
		insert into correoc values (runc,correo);
		if(select d.calle from direccion d where d.calle=ncalle AND num_casa=d.numero) IS NULL then
			insert into Direccion values (ncalle,num_casa,pasaje);
			insert into Pertenece values (ncalle,num_casa,cidc);
		else
		end if;
		insert into tienec values (ncalle,num_casa,runc);
		
	end if;
	end $$
language plpgsql;

Create or replace function elimcliente(in crunc varchar)
returns void as $$ declare
	n integer;
	c varchar;
	begin
	delete from correoc where runc=crunc;
	delete from telefonoc where runc=crunc;
	c:=(select calle) from tienec where runc=crunc;
	n:=(select numero) from tienec where runc=crunc;
	delete from direccion where calle=c and numero=n;
	delete from cliente where run=crunc;
	end $$
language plpgsql;

Create or replace function editcliente(in atributo varchar, in nuevoatributo varchar, in crunc varchar)
returns void as $$ declare
	i integer;
	begin
	if(atributo='nombres') then
		update cliente set nombres=nuevoatributo where crunc=run;
	elsif(atributo='apellidos') then
		update cliente set apellidos=nuevoatributo where crunc=run;
	elsif(atributo='telefono') then
		i:=cast(nuevoatributo as integer);
		update telefonoc set numero=i where crunc=runc;
	elsif(atributo='correo') then
		update correoc set email=nuevoatributo where crunc=runc;
	else
		raise exception 'no existe el atributo';
	end if;
	end $$
language plpgsql;

--select * from showclient()

Create or replace function editclientedireccion(in ciud varchar, in cal varchar, in num integer, in pasa varchar, in crunc varchar)
returns void as $$ declare
	idciud integer;
	n integer;
	c varchar;
	begin
	if(select nombre from ciudad where ciud=nombre) is null then
		raise exception 'esta ciudad no esta en el rango de los envios';
	else 
		idciud:=(select idc) from ciudad where ciud=nombre;
		n:=(select numero) from tienec where runc=crunc;
		c:=(select calle) from tienec where runc=crunc;
		update direccion set calle=cal  where calle=c and numero=n;
		update direccion set numero=num  where calle=cal and numero=n;
		update direccion set pasaje=pasa  where calle=cal and numero=num;
		update pertenece set idc=idciud where calle=cal and numero=num;
	end if;
	end $$
language plpgsql;
--Ingresar/editar/eliminar vendedores

--select elimvendedor('20.333.333-3','p','c','20-06-1998','Osorno','d',23,'f',123,'a','xd');
Create or replace function insertvendedor(in rune varchar, in nombres varchar, in apellidos varchar, in f_nacimiento date, in nCiudad varchar, in ncalle varchar, in num_Casa integer,
										in pasaje varchar, in num_telefono integer, in correo varchar, in pagina varchar)
returns void as $$ declare
	cidc integer;
	begin
	cidc:=(select idc) from ciudad where nCiudad=nombre;
	if(select run from emprendedor where rune=run) IS NOT NULL then 
		raise exception 'este rut ya esta registrado';
	elseif(select numero from telefonoe where num_telefono=numero) IS NOT NULL then 
		raise exception 'este telefono ya esta registrado';
	elseif(select email from correoe where correo=email) IS NOT NULL then 
		raise exception 'este correo ya esta registrado';
	elseif(select dominio from pag_web where pagina=dominio) IS NOT NULL then 
		raise exception 'esta pagina web ya esta registrada';	
	elseif(select nombre from ciudad where nCiudad=nombre) IS NULL then 
		raise exception 'esta ciudad no esta dentro del rango de envios';
	else
		insert into emprendedor values (rune,nombres,apellidos,f_nacimiento);
		insert into telefonoe values (rune,num_telefono);
		insert into correoe values (rune,correo);
		insert into pag_web values (rune,pagina);
		if(select d.calle from direccion d where d.calle=ncalle AND num_casa=d.numero) IS NULL then
			insert into Direccion values (ncalle,num_casa,pasaje);
			insert into Pertenece values (ncalle,num_casa,cidc);
		else
		end if;
		insert into tienee values (ncalle,num_casa,rune);
	end if;
	end $$
language plpgsql;



Create or replace function elimvendedor(in crune varchar)
returns void as $$ declare
	begin
	c:=(select calle) from tienee where runc=crune;
	n:=(select numero) from tienee where runc=crune;
	delete from direccion where calle=c and numero=n;
	delete from correoe where rune=crune;
	delete from telefonoe where rune=crune;
	delete from pag_web where rune=crune;
	delete from emprendedor where run=crune;
	end $$
language plpgsql;

Create or replace function editvendedor(in atributo varchar, in nuevoatributo varchar, in runc varchar)
returns void as $$ declare
	i integer;
	begin
	if(atributo='nombres') then
		update emprendedor set nombres=nuevoatributo where runc=run;
	elsif(atributo='apellidos') then
		update emprendedor set apellidos=nuevoatributo where runc=run;
	elsif(atributo='telefono') then
		i:=cast(nuevoatributo as integer);
		update telefonoe set numero=i where rune=runc;
	elsif(atributo='correo') then
		update correoe set email=nuevoatributo where rune=runc;
	elsif(atributo='dominio') then
		update pag_web set dominio=nuevoatributo where rune=runc;
	else 
		raise exception 'no existe el atributo';
	end if;
	end $$
language plpgsql;

Create or replace function editvendedordireccion(in ciud varchar, in cal varchar, in num integer, in pasa varchar, in crunc varchar)
returns void as $$ declare
	idciud integer;
	n integer;
	c varchar;
	begin
	if(select nombre from ciudad where ciud=nombre) is null then
		raise exception 'esta ciudad no esta en el rango de los envios';
	else 
		idciud:=(select idc) from ciudad where ciud=nombre;
		n:=(select numero) from tienee where rune=crunc;
		c:=(select calle) from tienee where rune=crunc;
		update direccion set calle=cal  where calle=c and numero=n;
		update direccion set numero=num  where calle=cal and numero=n;
		update direccion set pasaje=pasa  where calle=cal and numero=num;
		update pertenece set idc=idciud where calle=cal and numero=num;
	end if;
	end $$
language plpgsql;

--Ingresar/editar/eliminar productos.

Create or replace function insertproductos(in idcategoria integer, in id integer, in nombre varchar, in tamano varchar,
										  in peso numeric, in color varchar, in material varchar, in descripcion varchar)
returns void as $$ declare
	begin
	insert into producto values (idcategoria,id,nombre,tamano,peso,color,material,descripcion);
	end $$
language plpgsql;

Create or replace function elimproductos(in idp integer)
returns void as $$ declare
	begin
	delete from producto where id=idp;
	end $$
language plpgsql;

Create or replace function editproductos(in atributo varchar, in nuevoatributo varchar, in idp integer)
returns void as $$ declare i integer;
	begin
	if(atributo='idca' or atributo='idcategoria') then
		i:= cast(nuevoatributo as integer);
		update producto set idca=i where id=idp;
	elsif(atributo='nombre') then
		update producto set nombre=nuevoatributo where id=idp;
	elsif(atributo='tamano') then
		update producto set tamano=nuevoatributo where id=idp;
	elsif(atributo='peso') then
		i:=cast(nuevoatributo as integer);
		update producto set peso=i where id=idp;
	elsif(atributo='color') then
		update producto set color=nuevoatributo where id=idp;
	elsif(atributo='mat_principar' or atributo='material') then
		update producto set mat_principar=nuevoatributo where id=idp;
	elsif(atributo='descripcion') then
		update producto set descripcion=nuevoatributo where id=idp;
	end if;
	end $$
language plpgsql;



--Ingresar/editar/eliminar modo de pago.


Create or replace function insertm_pago(in id integer, in descripcion varchar)
returns void as $$ declare
	begin
	insert into m_pago values (id, descripcion);
	end $$
language plpgsql;

Create or replace function elim_pago(in idt integer)
returns void as $$ declare
	begin
	delete from m_pago where id=idt;
	end $$
language plpgsql;

Create or replace function editm_pago(in idt integer, in ndescripcion varchar)
returns void as $$ declare
	begin
		update m_pago set descripcion=ndescripcion where id=idt;
	end $$
language plpgsql;


-- crear el menu

create table menud(
funcion varchar Primary key,
descripcion text
);
create table menu(
funcion varchar Primary key,
descripcion text
);

insert into menud values ('select uno()', 'Gestionar la base de datos como administrador'),
('select dos()', 'ver reporte de ventas');

insert into menu values ('select a()', 'Cliente con mas compras'),('select b()', 'Vendedor con mas ventas'),
('select * from c()', 'Clientes sin compras el ultimo agno'),('select * from d()', 'Vendedor sin ventas el ultimo agno'),
('select * from e()', 'Productos mas vendidos el ultimo agno'),('select * from f()', 'Productos sin ventas el ultimo agno'),
('select * from g()', 'Servicios mas vendidos el ultimo agno'),('select * from h()', 'Servicios sin ventas el ultimo agno'),
('select * from i()', 'Elegir de un listado, todos los maestros y que despliegue la informacion asociada.'),
('select * from j()', ' Listar los clientes de un vendedor');




-- funciones del menu

Create or replace function uno()
returns text as $$ 
	declare 
	u varchar;
	begin
		u:=(cast((select current_user) as varchar));
		if u='postgres' then 
			return 'Puede continuar';
		else 
			raise exception 'no es el administrdor';
		end if;
	end $$
language plpgsql;

Create or replace function dos()
returns setof menu as $$ declare
	begin
		return query select * from menu;
	end $$
language plpgsql;


Create or replace function a()
returns varchar as $$ 
	declare
	algo record;
	client varchar;
	i integer;
	cur cursor for Select x.nombres, C.runC, SUM(C.sum1) AS cont
		From cliente x, (Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
		From (Select v.runC, Count(v.idM), v.Cantidad*m.M_neto AS total_pagado
		From Ventap v, Monto m
		Where v.M_bruto=m.M_bruto
		Group by v.runC,total_pagado) AS B
		Group by B.runC
		UNION
		Select B.runC, SUM(B.count) AS sum1, SUM(B.total_pagado) AS sum2
		From (Select v.runC, Count(Distinct v.idM), SUM(m.M_neto) AS total_pagado
		From Ventas v, Monto m
		Where v.M_bruto=m.M_bruto
		Group by v.runC) AS B
		Group by B.runC) AS C
		where c.runc=x.run
		Group by C.runC, x.nombres;
	begin
	i:=0;
	open cur;
	fetch cur into algo;
	While(FOUND) loop
		if(algo.cont>i) then
			i:=algo.cont;
			client:=algo.runc||'      '||algo.nombres;
		end if;
		fetch cur into algo;
	end loop;
	close cur;
	return client;
	end $$
language plpgsql;


Create or replace function b()
returns varchar as $$ declare
	algo record;
	emprendedor varchar;
	i integer;
	cur cursor for Select i.rune, e.nombres, i.max from emprendedor e,
		(Select i.rune, e.nombres, Sum(i.sum) as max
		From emprendedor e, (Select D.rune, D.idp, Sum(D.c) 
		from (Select rune, idp, Count(Distinct idp) AS c
		From Ventap
		Group by rune,idp,Cantidad) AS D
		group by D.rune,D.idp) AS i
		Where i.rune=e.run
		Group by i.rune, e.nombres
		UNION
		Select Distinct v.rune, pr.nombre,t1.max
		From s, Ventas v, servicio pr,(Select Distinct rune ,sum(num) as max
		From s
		group by rune)AS t1
		Where s.num=t1.max And s.rune=t1.rune AND s.id=pr.id And s.rune=v.rune) AS i
		where i.rune=e.run;
	begin
		i:=0;
	open cur;
	fetch cur into algo;
	While(FOUND) loop
		if(algo.max>i) then
			i:=algo.max;
			emprendedor:=algo.rune||'      '||algo.nombres;
		end if;
		fetch cur into algo;
	end loop;
	close cur;
	return emprendedor;
	end $$
language plpgsql;


Create or replace function c(out nombreCliente varchar, out runCliente varchar)
returns setof record as $$ 
	declare
	begin
		return query select nombres, run from cliente 
	where run NOT IN(select runc from ventas where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta)
					 UNION select runc from ventap where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta));
	end $$
language plpgsql;

Create or replace function d(out nombreVendedor varchar, out runVendedor varchar)
returns setof record as $$ 
	declare
	begin
		return query select nombres, run from emprendedor 
	where run NOT IN(select rune from ventas where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta)
					 UNION select rune from ventap where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta));
	end $$
language plpgsql;


--top 3 productos mas comprados
Create or replace function e(out nombreProducto varchar, out cantvendida integer)
returns setof record as $$ 
	declare
	a integer; b integer; c integer;
	id1 integer; id2 integer; id3 integer;
	rec record;
	cur cursor for Select D.rune, D.idp, Sum(D.c)
		from (Select rune, idp, Count(Distinct idp)*Cantidad AS c
		From Ventap
		where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta)
		Group by rune,idp,Cantidad) AS D
		group by D.rune,D.idp;
	begin
		a:=0; b:=0; c:=0;
		open cur;
		fetch cur into rec;
		while(FOUND) loop
		if(rec.sum>a) then
			a:=rec.sum;
			id1:=rec.idp;
		elsif(rec.sum>b) then
			b:=rec.sum;
			id2:=rec.idp;
		elsif(rec.sum>c) then
			c:=rec.sum;
			id3:=rec.idp;
		end if;
		fetch cur into rec;
	end loop;
	return query select nombre, a from producto where id1=id
			UNION
			select nombre, b from producto where id2=id 
			UNION
			select nombre, c from producto where id3=id; 
		close cur;
	end $$
language plpgsql;

Create or replace function f(out nombreProducto varchar, out detalle varchar)
returns setof record as $$ 
	declare
	begin
		return query select nombre, descripcion from producto
	where id NOT IN(select distinct idp from ventap where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta));
	end $$
language plpgsql;


--top 3 servicios
Create or replace function g(out nombreServicio varchar, out cantidad integer)
returns setof record as $$ 
	declare
	a integer; b integer; c integer;
	id1 integer; id2 integer; id3 integer;
	rec record;
	cur cursor for Select D.rune, D.ids, D.c
		from (Select rune, ids, Count(ids) AS c
		From Ventas
		where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta)
		Group by rune,ids) AS D;
	begin
		a:=0; b:=0; c:=0;
		open cur;
		fetch cur into rec;
		while(FOUND) loop
		if(rec.c>a) then
			a:=rec.c;
			id1:=rec.ids;
		elsif(rec.c>b) then
			b:=rec.c;
			id2:=rec.ids;
		elsif(rec.c>c) then
			c:=rec.c;
			id3:=rec.ids;
		end if;
		fetch cur into rec;
	end loop;
	return query select nombre, a from servicio where id1=id
			UNION
			select nombre, b from servicio where id2=id 
			UNION
			select nombre, c from servicio where id3=id; 
		close cur;
	end $$
language plpgsql;


Create or replace function h(out nombreServicio varchar, out detalle varchar)
returns setof record as $$ 
	declare
	begin
		return query select nombre, descripcion from servicio
	where id NOT IN(select distinct ids from ventas where DATE_PART('year',current_date)=DATE_PART('year',fecha_venta));
	end $$
language plpgsql;

Create or replace function i(in idmaestro integer,out nombre_pro_sv varchar, out precio_unidad integer, out f_venta date)
returns setof record as $$ 
	declare
	begin
		if(select id from maestro where idmaestro=id)IS NOT NULL then 
			return query select i.nombre, i.m_bruto as precio_uni, i.fecha_venta
				from (select p.nombre, v.m_bruto, v.fecha_venta 
					 from ventap v, producto p 
					 where idmaestro=v.idm AND v.idp=p.id
					 UNION
					 select s.nombre, v.m_bruto, v.fecha_venta 
					 from ventas v, servicio s 
					 where idmaestro=v.idm AND v.ids=s.id) as i;
		else 
			raise exception 'esta id no existe';
		end if;
	end $$
language plpgsql;

Create or replace function j(in nombre varchar, out nombreEmprendedor varchar, out nombreCliente varchar)
returns setof record as $$ 
	declare
	begin  
		return query select * from v5(nombre);
	end $$
language plpgsql;



--funciones aparte




--muestra todos los datos de cliente
Create or replace function showclient(out runCL varchar, out nombreCL varchar, out apellidoCL varchar, out f_nacCL date,
									 out numero_telefono integer, out mail varchar, out nombreCiudad varchar, out calleCL varchar
									 ,out numeroCasa integer)
returns setof record as $$ 
	declare
	begin  
		return query select c.run,c.nombres,c.apellidos,c.f_nacimiento, t.numero, m.email, ci.nombre, d.calle, d.numero from cliente c, telefonoc t, correoc m, direccion d, ciudad ci, tienec tc, pertenece p
		where c.run=t.runc AND c.run=m.runc AND tc.runc=c.run AND d.numero=tc.numero AND d.calle=tc.calle AND d.numero=p.numero AND d.calle=p.calle
		AND p.idc=ci.idc;
	end $$
language plpgsql;

--muestra todo los datos de emprendedor

Create or replace function showseller(out runEM varchar, out nombreEM varchar, out apellidoEM varchar, out f_nacEM date,
									 out numero_telefono integer, out mail varchar, out pag_webEM varchar, out nombreCiudad varchar, out calleCL varchar
									 ,out numeroCasa integer)
returns setof record as $$ 
	declare
	begin  
		return query select e.run,e.nombres,e.apellidos,e.f_nacimiento, t.numero, m.email, pa.dominio, ci.nombre, d.calle, d.numero from emprendedor e, telefonoe t, correoe m, direccion d, ciudad ci, tienee tc, pertenece p, pag_web pa
		where e.run=t.rune AND e.run=m.rune AND tc.rune=e.run AND d.numero=tc.numero AND d.calle=tc.calle AND d.numero=p.numero AND d.calle=p.calle
		AND p.idc=ci.idc AND pa.rune=e.run;
	end $$
language plpgsql;

