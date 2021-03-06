create database Proyecto;
use Proyecto;
-- drop database Proyecto;

create table roles
(rol int(30) primary key,
nombre_rol varchar(50)
);

insert into roles(rol,nombre_rol)
values(1,'Administrador'),(2,'Funcionario'),(3,'Veterinaria'),(4,'Ciudadano');


create table login_usuarios
(nombre_usuario varchar(50) primary key,
clave varchar(50) not null,
rol_login int(30), 
constraint ro0 foreign key (rol_login) references roles(rol) on delete cascade on update cascade
);
alter table login_usuarios add foto varchar(255);

insert into login_usuarios(nombre_usuario,clave,rol_login,foto)
values('Juan','123',4,'usuario.jpeg'),
('Veterinaria-1','veterinaria',3,'usuario.jpeg'),
('12348765','funcionario',2,'usuario.jpeg'),
('James','admin',1,'usuario.jpeg');

insert into login_usuarios(nombre_usuario,clave,rol_login,foto)
values ('David','admin',1,'usuario.jpeg');


create table ciudadano
(cedula varchar (50) primary key , 
nombre varchar (45),
telefono varchar (20),
direccion varchar(45),
correo varchar (45),
usuario_ciu varchar(50),
constraint usu foreign key (usuario_ciu) references login_usuarios(nombre_usuario) on delete cascade on update cascade
);

insert into ciudadano(cedula,nombre,telefono,direccion,correo,usuario_ciu)
values 
('1234567898','Juan Rodriguez','3132784923','cll 3 # 3-25','Alex.99@hotmail.com','Juan');

create table animal (
codigo_animal int(30) auto_increment primary key,
nombre_animal varchar (50) not null,
tipo_animal varchar (50) not null,
edad_animal varchar(5) not null,
raza_animal varchar(30) not null
);
alter table animal add foto varchar(255);
alter table animal add tamano varchar(30);
alter table animal add genero varchar(30);
alter table animal add color varchar(30);

insert into animal(nombre_animal,tipo_animal,edad_animal,raza_animal,foto,tamano,genero,color)
values
('Terry','Perro','3','Beagle','animal1.jpeg','Grande','Macho','Negro'),
('Mifu','Gato','1','Persa','animal2.jpeg','Mediano','Macho','Cafe'),
('Luna','Perro','2','Boxer','animal3.jpeg','Grande','Hembra','Negro y Cafe');


create table adoptados(
codigo_adoptado int(30) auto_increment primary key,
nombre_animal varchar (50) not null,
tipo_animal varchar (50) not null,
edad_animal varchar(5) not null,
raza_animal varchar(30) not null
);
alter table adoptados add foto varchar(255);
alter table adoptados add tamano varchar(30);
alter table adoptados add genero varchar(30);
alter table adoptados add color varchar(30);

insert into adoptados(nombre_animal,tipo_animal,edad_animal,raza_animal,foto,tamano,genero,color)
values
('Terry','Perro','3','Beagle','animal1.jpeg','Grande','Macho','Negro'),
('Mifu','Gato','1','Persa','animal2.jpeg','Mediano','Macho','Cafe'),
('Luna','Perro','2','Boxer','animal3.jpeg','Grande','Hembra','Negro y Cafe');


create table jornada
(codigo_jornada int (30) auto_increment primary key ,
fecha date,
lugar varchar(45),
duracion varchar(20));

alter table jornada add descripcion varchar(255);
alter table jornada add foto varchar(255);

-- drop table jornada;

insert into jornada(fecha,lugar,duracion,descripcion,foto)
values
('2019/03/02','Parque Central','2 horas','Jornada de Vacunacion','evento1.jpeg'),
('2019/03/01','Parque de Mosquera','3 horas','Jornada de Baño','evento2.jpeg');

create table preguntas
(respuesta1 int,
respuesta2 int,
respuesta3 int,
respuesta4 int,
respuesta5 int,
respuesta6 int,
respuesta7 int,
respuesta8 int,
respuesta9 int,
respuesta10 int,
respuesta11 int,
respuesta12 int,
respuesta13 int,
respuesta14 int,
respuesta15 int,
respuesta16 int,
respuesta17 int,
respuesta18 int,
respuesta19 int,
respuesta20 int,
cedula varchar(50) primary key,
constraint ciu foreign key (cedula) references ciudadano (cedula) on delete cascade on update cascade);

-- drop table preguntas;

create table respuesta_pre
(
cedula varchar(50) primary key,
respuesta_fin int,
constraint rciu foreign key (cedula) references ciudadano (cedula) on delete cascade on update cascade);

-- drop table respuesta_pre;


create table postulacion
(codigo_postulacion int (30) auto_increment primary key,
telefono_contacto varchar (20),
direccion_contacto varchar (20),
telefono_fijo varchar (20),
cedula_pdf varchar(255),
estrato int(3),
residentes int(3),
ubicacion varchar(100),
tipo_vivienta varchar(100),
resultado_puntos int(4),
recibo_pub varchar(255),
cedu varchar (50),
constraint ciud foreign key (cedu) references ciudadano(cedula) on delete cascade on update cascade);
alter table postulacion add codigo_animal int(30);
alter table postulacion add constraint omaiba foreign key (codigo_animal) references animal (codigo_animal) on delete cascade on update cascade;

-- drop table postulacion;
create table citacion(
cedula varchar(50) primary key,
mensaje varchar(255),
fecha date,
hora time,
validacion varchar(255),
postulacion int(30),
constraint postula foreign key (postulacion) references postulacion(codigo_postulacion) on delete cascade on update cascade,
constraint ced_vis foreign key (cedula) references ciudadano(cedula) on delete cascade on update cascade);

create table validacion(
cedula varchar(50) primary key,
mensaje varchar(255),
constraint ced_con foreign key (cedula) references ciudadano(cedula) on delete cascade on update cascade);

create table seguimiento
(codigo_seguimiento int (30) auto_increment primary key,
postulacion int (30),
telefono_contacto varchar (20),
direccion_contacto varchar (20),
telefono_fijo varchar (20),
cedula_pdf varchar(255),
estrato int(3),
residentes int(3),
ubicacion varchar(100),
tipo_vivienta varchar(100),
resultado_puntos int(4),
recibo_pub varchar(255),
cedu varchar (50),
animal int(30),
fecha_citacion date,
mensaje_respuesta varchar(255)
);
alter table seguimiento add constraint naur foreign key (animal) references animal (codigo_animal) on delete cascade on update cascade;
alter table seguimiento add constraint pos foreign key(postulacion) references postulacion (codigo_postulacion) on delete cascade on update cascade;
alter table seguimiento add constraint ciuxp foreign key (cedu) references ciudadano (cedula) on delete cascade on update cascade;

-- drop table seguimiento;



create table veterinaria (
nit_veterinaria varchar(50) primary key,
telefono_veterinaria varchar(30) not null,
nombre_veterinaria varchar(50) not null,
direccion_veterinaria varchar(50) not null,
constraint nit foreign key (nit_veterinaria) references login_usuarios(nombre_usuario) on delete cascade on update cascade
);

-- drop table veterinaria;

insert into veterinaria(nit_veterinaria,telefono_veterinaria,nombre_veterinaria,direccion_veterinaria)
values 
('Veterinaria-1','3137425832','Huellas Peludas','Calle 14#32-45');


create table funcionario (
cedula_funcionario varchar(50) primary key,
telefono_funcionario varchar(30) not null,
nombre_funcionario varchar (50) not null,
correo_funcionario varchar (100) not null,
cargo varchar(50),
dependencia varchar(50),
constraint ced foreign key (cedula_funcionario) references login_usuarios(nombre_usuario) on delete cascade on update cascade
);

-- drop table funcionario;

insert into funcionario(cedula_funcionario,telefono_funcionario,nombre_funcionario,correo_funcionario,cargo,dependencia)
values
('12348765','3216440371','Oscar Perez','oscar@gmail.com','Funcionario','Alcaldia Mosquera');



create table mascota
(codigo_mascota int (30) auto_increment primary key ,
nombre_mascota varchar(50),
tipo_mascota varchar (50),
edad_mascota varchar(5),
raza_mascota varchar(30),
foto varchar(255),
tamano varchar(30),
genero varchar(30),
color varchar(30),
ced varchar (20),
constraint ciuda foreign key (ced) references ciudadano (cedula) on delete cascade on update cascade);


insert into mascota(nombre_mascota,tipo_mascota,edad_mascota,raza_mascota,foto,tamano,genero,color,ced)
values
('poppy','Perro','2','Pitbull','animal1.jpeg','Grande','Hembra','Blanco','1234567898');



create table asiste
(cod_mascota int (30) primary key auto_increment,
cod_jornada int(30) ,
constraint masco foreign key (cod_mascota) references mascota (codigo_mascota) on delete cascade on update cascade,
constraint jorna foreign key (cod_jornada) references jornada (codigo_jornada) on delete cascade on update cascade);


-- drop table asiste;

create table adopcion
(icono varchar(255),
codigo_adopcion int (30) primary key auto_increment,
animal int(30),
cedula varchar(50),
funcionario_encargado varchar(50),
constraint animali foreign key(animal) references adoptados(codigo_adoptado),
constraint funcion foreign key(funcionario_encargado) references funcionario(cedula_funcionario));
alter table adopcion add mensaje varchar(100);


create table denuncia
(codigo_denuncia int (30) auto_increment primary key,
fecha_denuncia date,
descripcion_denuncia varchar(150),
cedul_ciudadano varchar(20),
constraint ciudadanos foreign key (cedul_ciudadano) references ciudadano (cedula) on delete cascade on update cascade);
alter table denuncia add mensaje varchar(250);
alter table denuncia add foto varchar(250);
-- drop table denuncia; 

insert into denuncia (fecha_denuncia,descripcion_denuncia,cedul_ciudadano,mensaje,foto)
values
('2019/03/01','Abandono','1234567898','Abandono de un animal','denuncia1.jpeg');



create table comentarios
(codigo_comentario int (30) auto_increment primary key ,
fecha_comentario date,
cuerpo varchar (255),
cod_adop int (30)not null,
constraint adopci foreign key (cod_adop) references adopcion (codigo_adopcion) on delete cascade on update cascade);

-- drop table comentarios; 


create table respuestausuario
(icono varchar(255),
codigo_positivo int(30) Auto_Increment primary key,
cedula_respuesta varchar(50),
mensaje varchar(200),
ced_funcio varchar(30)not null,
constraint funci foreign key (ced_funcio) references funcionario(cedula_funcionario) on delete cascade on update cascade,
constraint cere foreign key(cedula_respuesta) references ciudadano(cedula) on delete cascade on update cascade);


-- drop table usuarios;

-- PREGUNTAS

/*Preguntas*/
-- use proyecto;
create procedure pregunta
(res1 int(4),res2 int(4),res3 int(4),res4 int(4),res5 int(4),res6 int(4),res7 int(4),res8 int(4),res9 int(4),res10 int(4),
res11 int(4),res12 int(4),res13 int(4),res14 int(4),res15 int(4),res16 int(4),res17 int(4),res18 int(4),res19 int(4),res20 int(4),ced varchar(50))
insert into preguntas(respuesta1,respuesta2,respuesta3,respuesta4,respuesta5,respuesta6,respuesta7,respuesta8,respuesta9,respuesta10,
respuesta11,respuesta12,respuesta13,respuesta14,respuesta15,respuesta16,respuesta17,respuesta18,respuesta19,respuesta20,cedula) 
values(res1,res2,res3,res4,res5,res6,res7,res8,res9,res10,res11,res12,res13,res14,res15,res16,res17,res18,res19,res20,ced);


create procedure preguntafin(ced varchar(50),rt int(11))
insert into respuesta_pre(cedula,respuesta_fin) 
values(ced,rt);


-- drop procedure preguntafin;


/*Respuesta positiva*/
create procedure inser_respuesta_positiva(icon varchar(255),cedu varchar(50),mensa varchar(200),enc varchar(30))
insert into respuestausuario (icono,cedula_respuesta,mensaje,ced_funcio) values(icon,cedu,mensa,enc);

-- drop procedure inser_respuesta_positiva;
/*ADMINISTRADOR*/
/*Insertar Administrador*/
create procedure inser_admin_Admin(us varchar(50),cla varchar(50),rol int(30),fot varchar(255))
insert into login_usuarios (nombre_usuario,clave,rol_login,foto)values(us,cla,rol,fot);

/*Modificar Administrador*/
create procedure login_usuariosact_admin_Admin(us varchar(50),cla varchar(50),fot varchar(255))
update login_usuarios set clave=cla,foto=fot where nombre_usuario=us;



-- drop procedure act_admin_Admin;
/*Eliminar Administrador*/
create procedure bor_admin_Admin(us varchar(50))
delete from login_usuarios where nombre_usuario=us;

-- drop procedure bor_admin_Admin;


/* ADOPCIONES */

Create procedure VetInsertar_Adopcion(ico varchar(255),ani int(30),cedu varchar(50),mens varchar(100),enc varchar(50))
insert into Adopcion (icono,animal,cedula,mensaje,funcionario_encargado) values(ico,ani,cedu,mens,enc);


Create procedure VetModificar_Adopcion( cod int(30),mens varchar(100))
Update Adopcion set mensaje=mens where codigo_adopcion=cod;

drop procedure VetModificar_Adopcion;

Create procedure VetEliminar_Adopcion( cod int(30))
Delete from Adopcion where codigo_adopcion=cod;

/*ANIMAL*/

/*Insertar Animal*/
create procedure inser_animal_Admin(nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255),tama varchar(30),gen varchar(30),col varchar(30))
insert into animal (nombre_animal,tipo_animal,edad_animal,raza_animal,foto,tamano,genero,color) values (nombre,tipo,edad,raza,imagen,tama,gen,col);
-- drop procedure inser_animal_Admin;

create procedure inser_adoptado_Admin(nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255),tama varchar(30),gen varchar(30),col varchar(30))
insert into adoptados (nombre_animal,tipo_animal,edad_animal,raza_animal,foto,tamano,genero,color) values (nombre,tipo,edad,raza,imagen,tama,gen,col);

/*Modificar Animal*/
create procedure act_animal_Admin(codigo int(30),nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255),tama varchar(30),gen varchar(30),col varchar(30))
update animal set nombre_animal=nombre,tipo_animal=tipo,edad_animal=edad,raza_animal=raza, foto=imagen, tamano=tama, genero=gen, color=col where codigo_animal=codigo;

create procedure act_adoptado_Admin(codigo int(30),nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255),tama varchar(30),gen varchar(30),col varchar(30))
update adoptados set nombre_animal=nombre,tipo_animal=tipo,edad_animal=edad,raza_animal=raza, foto=imagen, tamano=tama, genero=gen, color=col where codigo_adoptado=codigo;


-- drop procedure act_animal_Admin;

/*Borrar Animal*/
create procedure bor_animal_Admin(codig int(30))
delete from animal where codigo_animal=codig;

create procedure bor_animal_Admin2(codig int(30))
delete from adoptados where codigo_adoptado=codig;
-- drop procedure bor_animal_Admin;

/*CIUDADANO*/

/*Insertar Usuario*/
create procedure inser_usuario_Admin(cedu varchar(50), nom varchar(45),tel varchar(20), dir varchar(45), cor varchar(50),us varchar(50))
insert into ciudadano values(cedu,nom,tel,dir,cor,us);

/*Actualizar Usuario*/
create procedure act_usuario_Admin(cedu varchar(50),nom varchar(45),tel varchar(20), dir varchar(45),cor varchar(50))
update ciudadano set nombre=nom,telefono=tel,direccion=dir,correo=cor where cedula=cedu;

/*Borrar Usuario*/
create procedure bor_usuario_Admin(cedu varchar(50))
delete from ciudadano where cedula=cedu;

/*COMENTARIOS*/

/*Insertar Comentarios*/
create procedure usuario_comentarios_inser(fec date, cuerpo varchar(255), adop int(30))
insert into comentarios(fecha_comentario, cuerpo, cod_adop) values (fec, cuerpo, adop);

/*Modificar Comentarios*/
create procedure usuario_comentarios_actu(fec date, cuerpo varchar(255), adop int(30),cod int(30))
update comentarios set fecha_comentario=fec, cuerpo=cuerpo, cod_adop=adop where codigo_comentario=cod;

/*Eliminar Comentarios*/
create procedure usuario_comentarios_elim(cod int(30))
delete from comentarios where codigo_comentario=cod;

/*DENUNCIAS*/

/*Insertar Denuncias*/
Create procedure VetInsertar_Denuncias(fec_den date, descrip varchar(150), cedul varchar(20),men varchar(250),imagen varchar(250))
insert into denuncia (fecha_denuncia,descripcion_denuncia,cedul_ciudadano,mensaje,foto) values (fec_den, descrip, cedul,men,imagen);

/*Modificar Denuncias*/
Create procedure VetModificar_Denuncias( cod int(30), fec date, des varchar(150), ced varchar(20))
Update Denuncia set fecha_denuncia=fec, descripcion_denuncia=des, cedul_ciudadano=ced where codigo_denuncia=cod;

/*Eliminar Denuncias*/
Create procedure VetEliminar_Denuncia( cod int(30))
Delete from Denuncia where codigo_denuncia=cod; 

/*EVENTOS (JORNADAS)*/

/*Insertar Eventos*/
Create procedure FunInsertar_Eventos(fec date, lug varchar(45), dur varchar(20),des varchar(255),fot varchar(255))
insert into Jornada (fecha, lugar, duracion,descripcion, foto) values(fec,lug,dur,des,fot);

-- drop procedure FunInsertar_Eventos;




/*Modificar Eventos*/
Create procedure FunModificar_Eventos( cod int(30), fec date, lug varchar(45), dur varchar(20), des varchar(255),fot varchar(255))
Update jornada set fecha=fec, lugar=lug, duracion=dur, descripcion=des, foto=fot where codigo_jornada=cod; 
-- drop procedure FunModificar_Eventos;

/*Eliminar Eventos*/
Create procedure FunEliminar_Eventos( codi int(30))
Delete from jornada where codigo_jornada=codi;

-- drop procedure FunEliminar_Eventos;
/*FUNCIONARIO*/

/*Insertar Funcionario*/
create procedure Insertar_Funcionario(cedula varchar(30),telefono varchar(30),nombre varchar(50),correo varchar(100),car varchar(50),depen varchar(50))
insert into funcionario  (cedula_funcionario,telefono_funcionario,nombre_funcionario,correo_funcionario,cargo,dependencia)values(cedula,telefono,nombre,correo,car,depen);
-- drop procedure Insertar_Funcionario;

/*Modificar Funcionario*/
Create procedure Modificar_Funcionario( ced varchar(30), tel varchar(30), nom varchar(50), cor varchar(100),dep varchar(50))
Update Funcionario set telefono_funcionario=tel, nombre_funcionario=nom, correo_funcionario=cor, dependencia=dep where cedula_funcionario=ced; 
-- drop procedure Modificar_Funcionario;
/*Eliminar Funcionario*/
Create procedure Eliminar_Funcionario( cedu varchar(30))
Delete from funcionario where cedula_funcionario=cedu;

-- drop procedure Eliminar_Funcionario;
/*MASCOTA*/

/*Insertar Mascota*/
create procedure usuario_mascota_inser(nom_mas varchar(30), tipo varchar(50), edad varchar(5), raza varchar(30), fot varchar(255), tam varchar(30),gen varchar(30),col varchar(30) ,cedu varchar(20))
insert into mascota (nombre_mascota,tipo_mascota,edad_mascota,raza_mascota,foto,tamano,genero,color,ced) values (nom_mas,tipo,edad,raza,fot,tam,gen,col,cedu) ;

/*Insertar mascota adoptada*/
create procedure usuario_mascota_adop(nom_mas varchar(30), tipo varchar(50), edad varchar(5), raza varchar(30),fot varchar(255),tam varchar(30),gen varchar(30),col varchar(30) ,cedu varchar(20))
insert into mascota (nombre_mascota,tipo_mascota,edad_mascota,raza_mascota,foto,tamano,genero,color,ced) values (nom_mas,tipo,edad,raza,fot,tam,gen,col,cedu) ;

-- drop procedure usuario_mascota_adop;

/*Modificar Mascota*/
create procedure usuario_mascota_actu
(cod_mas int(30), nom_mas varchar(30), tipo varchar(50), edad varchar(5), raza varchar(30),fot varchar(255), tam varchar(30),gen varchar(30),col varchar(30) ,cedu varchar(20))
update mascota set nombre_mascota=nom_mas, tipo_mascota=tipo, edad_mascota=edad, raza_mascota=raza, foto=fot, tamano=tam, genero=gen, color=col where ced=cedu and codigo_mascota=cod_mas;
-- drop procedure usuario_mascota_actu;

/*Eliminar Mascota*/
create procedure usuario_mascota_elim(cod varchar(20))
delete from mascota where codigo_mascota=cod;

-- drop procedure usuario_mascota_elim;

/*POSTULACION*/

/*Insertar Postulacion*/
create procedure usuario_postulacion_inser(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20),ced_pdf varchar(255),est int(3),res int(3),ub varchar(100),tip varchar(100),resu int(4),reci varchar(255), cedu varchar(20),con_ani int(30))
insert into postulacion (telefono_contacto,direccion_contacto,telefono_fijo,cedula_pdf,estrato,residentes,ubicacion,tipo_vivienta,resultado_puntos,recibo_pub,cedu,codigo_animal) values (tel_con, dir_con, tel_fij,ced_pdf,est,res,ub,tip,resu,reci,cedu,con_ani);
-- drop procedure usuario_postulacion_inser;

/*Modificar Postulacion*/
create procedure usuario_postulacion_actu(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20), cer_lab varchar(255), cedul varchar(20),cod_post int(30))
update postulacion set telefono_contacto=tel_con,direccion_contacto=dir_con,telefono_fijo=tel_fij,certificado_laboral=cer_lab where cedu=cedul and codigo_postulacion=cod_post;

/*Eliminar Postulacion*/
create procedure usuario_postulacion_elim(codpost varchar(20))
delete from postulacion where codigo_postulacion=codpost;

/*CITACION*/
create procedure Insertar_Citacion(cedu varchar(50),mens varchar(255), fech datetime, hor time,pos int(30))
insert into citacion(cedula,mensaje,fecha,hora,postulacion) values (cedu,mens,fech,hor,pos);

create procedure Respuesta_Citacion(pos int(30),men varchar(255))
update seguimiento set mensaje_respuesta=men where postulacion=pos;

Create procedure Eliminar_Fecha(pos int(30))
update seguimiento set fecha_citacion=null where postulacion=pos;

Create procedure Actualizar_Fecha(pos int(30),fec date,men varchar(255))
update seguimiento set fecha_citacion=fec, mensaje_respuesta=men where postulacion=pos;

Create procedure Actualizar_Fecha_Citacion(pos int(30), men varchar(255), fec date, hor time)
update citacion set mensaje=men, fecha=fec, hora=hor where postulacion=pos;

-- drop procedure Actualizar_Fecha_Citacion; 

/*SEGUIMIENTO*/

/*Insertar Seguimiento*/
create procedure FunInsertar_Seguimiento(postulacion int(30),tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20),ced_pdf varchar(255),est int(3),res int(3),ub varchar(100),tip varchar(100),resu int(4),reci varchar(255), cedu varchar(20),con_ani int(30),fech_c date,mere varchar(255))
insert into seguimiento (postulacion,telefono_contacto,direccion_contacto,telefono_fijo,cedula_pdf,estrato,residentes,ubicacion,tipo_vivienta,resultado_puntos,recibo_pub,cedu,animal,fecha_citacion,mensaje_respuesta) values (postulacion,tel_con, dir_con, tel_fij, ced_pdf,est,res,ub,tip,resu,reci,cedu,con_ani,fech_c,mere);
-- drop procedure FunInsertar_Seguimiento;


/*Modificar Seguimiento*/
Create procedure FunModificar_Seguimiento( cod int(30), cdp int(30))
Update Seguimiento set cod_postula=cdp where codigo_Seguimiento=cod; 

/*Eliminar Seguimiento*/
Create procedure FunEliminar_Seguimiento( cod int(30))
Delete from Seguimiento where codigo_Seguimiento=cod;

/*VETERINARIA*/

/*Insertar Veterinaria*/
create procedure inser_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50))
insert into veterinaria (nit_veterinaria,telefono_veterinaria,nombre_veterinaria,direccion_veterinaria) values(nit,tel,nombre,dir);
-- drop procedure inser_veter_Admin;

/*Modificar Veterinaria*/
create procedure act_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50))
update veterinaria set telefono_veterinaria=tel,nombre_veterinaria=nombre,direccion_veterinaria=dir where nit_veterinaria=nit;

/*Eliminar Veterinaria*/
create procedure bor_veter_Admin(nit varchar(30))
delete from veterinaria where nit_veterinaria=nit;

/*USUARIO VETERINARIA*/
/*Insertar  USUARIO Veterinaria*/
create procedure inser_usu_vet(us varchar(50),cla varchar(50),rol int(30))
insert into login_usuarios (nombre_usuario,clave,rol_login) values(us,cla,rol);
/*USUARIO FUNCIONARIO*/
/*Insertar  USUARIO FUNCIONARIO*/
create procedure inser_usu_func(ced varchar(50),cla varchar(50),rol int(30))
insert into login_usuarios (nombre_usuario,clave,rol_login) values(ced,cla,rol);

create procedure inser_fun_func(ced varchar(50),rol int(30))
insert into funcionario(cedula_funcionario,rol3) values (ced,rol);
/*USUARIO Ciudadano*/
/*Insertar  USUARIO Ciudadano*/
create procedure inser_usu_ciud(nom varchar(50),cla varchar(50),rol int(30))
insert into login_usuarios (nombre_usuario,clave,rol_login) values(nom,cla,rol);

create procedure inser_fun_ciud(nom varchar(50))
insert into ciudadano(usurio_ciu) values (nom);

create procedure inser_us_vet(nit varchar(50),rol int(30))
insert into veterinaria (nit_veterinaria,rol2) values(nit,rol);



/*Modificar Usuarios*/
create procedure mod_usu(us varchar(50),cla varchar(50))
update login_usuarios set clave=cla where nombre_usuario=us;/*

-- CONSULTA 1
select nombre,cedula,correo,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula = mascota.ced
where tipo_mascota ='perro';

-- CONSULTA 2 
select nombre,cedula,correo,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula = mascota.ced
where tipo_mascota ='gato';



-- CONSULTA 3
select codigo_mascota,nombre_mascota,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced as Cedula,fecha,lugar,duracion from mascota
inner join asiste on mascota.codigo_mascota =asiste.cod_mascota
inner join jornada on asiste.cod_jornada=jornada.codigo_jornada
where duracion>'03:00:00';

-- CONSULTA 4 
select nombre_animal,edad_animal,raza_animal from animal
where tipo_animal='perro';

-- CONSULTA 5
select nombre_animal,edad_animal,raza_animal from animal
where tipo_animal='gato';

-- CONSULTA 6
select codigo_mascota,nombre_mascota,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced as Cedula,fecha,lugar,duracion from mascota
inner join asiste on mascota.codigo_mascota =asiste.cod_mascota
inner join jornada on asiste.cod_jornada=jornada.codigo_jornada
where lugar='parque las aguas';
 
 -- CONSULTA 7
select nombre,direccion,telefono,descripcion_denuncia from ciudadano
inner join denuncia on ciudadano.cedula=denuncia.cedul_ciudadano
where descripcion_denuncia='abandono';

-- CONSULTA 8
select lugar,duracion,fecha from jornada
where month(fecha)='02';

-- CONSULTA 9
select fecha_denuncia,descripcion_denuncia,cedul_ciudadano ,fecha_respuesta from denuncia
inner join respuesta  on denuncia.codigo_denuncia=respuesta.cod_denu 
where month(fecha_respuesta)='06';

-- CONSUTA 10
select nombre,telefono,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula=mascota.ced
where estado_mascota='operado';
insert into usuarios(nom_usuario,clave,rol5) values ('AlexElCapo','1111',4), ('JuanMakia','0000',4), ('72471422','0000',2), ('52849421','0000',2), ('68470826','0000',2), ('98374971','0000',2), ('41683731','0000',2), ('811192822-A','veterinaria',3), ('811192822-B','veterinaria',3), ('811192822-C','veterinaria',3), ('811192822-D','veterinaria',3), ('Alf','4321',1)

*/