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

insert into login_usuarios(nombre_usuario,clave,rol_login)
values('AlexElCapo','1111',4),
('JuanMakia','0000',4),
('811192822-A','veterinaria',3),
('811192822-B','veterinaria',3),
('811192822-C','veterinaria',3),
('811192822-D','veterinaria',3),
('72471422','0000',2),
('52849421','0000',2),
('68470826','0000',2),
('98374971','0000',2),
('41683731','0000',2),
('Alf','4321',1);

insert into login_usuarios(nombre_usuario,clave,rol_login)
values ('Fla','4321',1);


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
('9907162019','Alex','3132784923','cll 3 # 3-25','Alex.99@hotmail.com','AlexElCapo'),
('1001263254','Juan','3101827462','cra 2 # 2-30','Juan.r4r3@hotmail.com','JuanMakia');

create table animal (
codigo_animal int(30) auto_increment primary key,
nombre_animal varchar (50) not null,
tipo_animal varchar (50) not null,
edad_animal varchar(5) not null,
raza_animal varchar(30) not null
);
alter table animal add foto varchar(255);
alter table animal add tamaño varchar(30);
alter table animal add genero varchar(30);
alter table animal add color varchar(30);



insert into animal(nombre_animal,tipo_animal,edad_animal,raza_animal)
values
('Terry','Perro','3','Beagle'),
('Joel','Perro','1','Doberman'),
('Paco','Perro','2','Boxer'),
('Roger','Perro','4','Gran Danes'),
('Bob','Perro','5','Akita'),
('Charly','Perro','3','Beagle'),
('Lola','Gato','2','Persa'),
('Mia','Gato','3','Bengala'),
('Kira','Gato','1','Siames'),
('Tom','Gato','1','Burmes');

create table jornada
(codigo_jornada int (30) auto_increment primary key ,
fecha date,
lugar varchar(45),
duracion text);

alter table jornada add descripcion varchar(255);

insert into jornada(fecha,lugar,duracion)
values
('2018/05/16','Parque Central','2 horas'),
('2018/02/23','Parque de Mosquera','3 horas'),
('2018/01/10','Parque Mi Mascota','3 horas'),
('2017/04/15','Parque Las Aguas','3 horas'),
('2019/12/10','Parque Las Aguas','3 horas'),
('2018/03/25','Parque Sabana','3 horas'),
('2018/09/30','Parque Mi Mascota','3 horas'),
('2018/07/16','Parque Mi Mascota','3 horas'),
('2018/01/27','Parque Sabana','3 horas'),
('2018/02/10','Parque Central','3 horas');


create table postulacion
(codigo_postulacion int (30) auto_increment primary key,
telefono_contacto varchar (20),
direccion_contacto varchar (20),
telefono_fijo varchar (20),
certificado_laboral varchar(255),
cedu varchar (50),
constraint ciu foreign key (cedu) references ciudadano (cedula) on delete cascade on update cascade);
alter table postulacion add codigo_animal int(30);
alter table postulacion add constraint  ca foreign key (codigo_animal) references animal (codigo_animal) on delete cascade on update cascade;
insert into postulacion(telefono_contacto,direccion_contacto,telefono_fijo,certificado_laboral,cedu,codigo_animal)
values 
('3137506273','Calle 100#52-32','8236611','','9907162019',1),
('3146748971','Calle 4#98-26','82314887','','9907162019',3);

-- drop table postulacion;
create table seguimiento
(codigo_seguimiento int(30) auto_increment primary key,
cod_postula int(30),
constraint postul foreign key (cod_postula) references postulacion (codigo_postulacion) on delete cascade on update cascade
);

insert into seguimiento(cod_postula)
values
(1),
(2);

create table veterinaria (
nit_veterinaria varchar(50) primary key,
telefono_veterinaria varchar(30) not null,
nombre_veterinaria varchar(50) not null,
direccion_veterinaria varchar(50) not null,
rol2 int(30),	
constraint ro2 foreign key (rol2) references roles(rol) on delete cascade on update cascade,
constraint nit foreign key (nit_veterinaria) references login_usuarios(nombre_usuario) on delete cascade on update cascade
);

-- drop table veterinaria;

insert into veterinaria(nit_veterinaria,telefono_veterinaria,nombre_veterinaria,direccion_veterinaria,rol2)
values 
('811192822-A','3137425832','Mis patitas','Calle 14#32-45',3),
('811192822-B','3142315647','Mis huellitas','Calle 13#05-45',3),
('811192822-C','3153216798','Mis mascotas','Calle 23#34-25',3),
('811192822-D','3113216547','Guau y miau','Calle 11#13-22',3);

create table funcionario (
cedula_funcionario varchar(50) primary key,
telefono_funcionario varchar(30) not null,
nombre_funcionario varchar (50) not null,
correo_funcionario varchar (100) not null,
rol3 int(30),
constraint ro3 foreign key (rol3) references roles(rol) on delete cascade on update cascade,
constraint ced foreign key (cedula_funcionario) references login_usuarios(nombre_usuario) on delete cascade on update cascade
);

-- drop table funcionario;

insert into funcionario(cedula_funcionario,telefono_funcionario,nombre_funcionario,correo_funcionario,rol3)
values
('72471422','3216440371','Manuel','manuelito@gmail.com',2),
('52849421','3135487561','Lucas','luquitas@gmail.com',2),
('68470826','3116548712','Juan','juansito@gmail.com',2),
('98374971','3135487654','Ivan','ivansito@gmail.com',2),
('41683731','3106547875','Sergio','sergiofon@gmail.com',2);

create table mascota
(codigo_mascota int (30) auto_increment primary key ,
nombre_mascota varchar(30),
descendencia varchar (30),
estado_mascota varchar(45),
tipo_mascota varchar(20) not null,
edad_mascota varchar(20),
raza_mascota varchar (20),
ced varchar (20),
constraint ciuda foreign key (ced) references ciudadano (cedula) on delete cascade on update cascade);
alter table mascota add foto varchar(250);

insert into mascota(nombre_mascota,descendencia,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced)
values
('poppy','cruce pitbull-doberman','enfermo','perro','5','pitbull','9907162019'),
('garen','puro','Sano','gato','2','persa','1001263254');

create table asiste
(cod_mascota int (30) primary key auto_increment,
cod_jornada int(30) ,
constraint masco foreign key (cod_mascota) references mascota (codigo_mascota) on delete cascade on update cascade,
constraint jorna foreign key (cod_jornada) references jornada (codigo_jornada) on delete cascade on update cascade);

insert into asiste()
values
(),
();

create table adopcion
(codigo_adopcion int (30) primary key auto_increment,
cod_ani int (30) not null,
cod_seg int (30) not null,
constraint seg foreign key (cod_seg) references seguimiento (codigo_seguimiento) on delete cascade on update cascade,
constraint ani foreign key (cod_ani) references animal (codigo_animal) on delete cascade on update cascade);
alter table adopcion add mensaje varchar(100);

insert into adopcion(cod_ani,cod_seg)
values
(1,1),
(2,2);

create table denuncia
(codigo_denuncia int (30) auto_increment primary key,
fecha_denuncia date,
descripcion_denuncia varchar(150),
cedul_ciudadano varchar(20),
constraint ciudadanos foreign key (cedul_ciudadano) references ciudadano (cedula) on delete cascade on update cascade);
alter table denuncia add mensaje varchar(250);
alter table denuncia add foto varchar(250);
-- drop table denuncia; 

insert into denuncia (fecha_denuncia,descripcion_denuncia,cedul_ciudadano)
values
('2018/05/27','abandono','9907162019'),
('2018/04/26','abandono','1001263254');



create table respuesta
(codigo_respuesta int (30) primary key auto_increment,
fecha_respuesta date,
cod_denu int (30) not null,
ced_funcio varchar(30)not null,
constraint funci foreign key (ced_funcio) references funcionario(cedula_funcionario) on delete cascade on update cascade,
constraint denun foreign key (cod_denu) references denuncia(codigo_denuncia) on delete cascade on update cascade);

-- drop table respuesta;

insert into respuesta (fecha_respuesta,ced_funcio,cod_denu)
values
('2018/04/15','68470826',1),
('2018/06/26','68470826',2);

create table comentarios
(codigo_comentario int (30) auto_increment primary key ,
fecha_comentario date,
cuerpo varchar (255),
cod_adop int (30)not null,
constraint adopci foreign key (cod_adop) references adopcion (codigo_adopcion) on delete cascade on update cascade);

-- drop table comentarios; 

insert into comentarios (fecha_comentario,cuerpo,cod_adop)
values
('2018/03/12','proceso exitoso',1),
('2018/02/28','proceso regular',2);

CREATE TABLE usuarios(
    nom_usuario VARCHAR(50) primary key,
    clave VARCHAR(50),
    rol4 int(30),
    constraint ro4 foreign key (rol4) references roles(rol) on delete cascade on update cascade
);

insert into usuarios(nom_usuario,clave,rol4) values
('Alf','4321',1);

create table usuario_funcionario
(cedula_fun varchar (50) primary key,
clave varchar(50),
rol2 int(30),
constraint rof foreign key (rol2) references roles(rol) on delete cascade on update cascade
);
insert into usuario_funcionario(cedula_fun,clave,rol2)
values('9907162019','1111',2),
('1001263254','0000',2);

create table usuario_veterinaria
(
nit_veterinaria varchar(50) primary key,
clave varchar(50),
rol3 int(30),
constraint rov foreign key (rol3) references roles(rol) on delete cascade on update cascade
);
insert into usuario_veterinaria(nit_veterinaria,clave,rol3)
values('811192822-A','1111',3),
('811192822-B','0000',3);


-- drop table usuarios;


/*ADMINISTRADOR*/
/*Insertar Administrador*/
create procedure inser_admin_Admin(us varchar(50),cla varchar(50),rol int(30))
insert into login_usuarios (nombre_usuario,clave,rol_login)values(us,cla,rol);
call inser_admin_Admin('lol','123',1);

/*Modificar Administrador*/
create procedure act_admin_Admin(us varchar(50),cla varchar(50))
update login_usuarios set clave=cla where nombre_usuario=us;

-- drop procedure act_admin_Admin;
/*Eliminar Administrador*/
create procedure bor_admin_Admin(us varchar(50))
delete from login_usuarios where nombre_usuario=us;

-- drop procedure bor_admin_Admin;


/* ADOPCIONES */

Create procedure VetInsertar_Adopcion(cod int(30), cdan int(30), cods int(30))
insert into Adopcion values(codigo_adopcion, codigo_ani, codigo_seg);

Create procedure VetModificar_Adopcion( cod int(30), cdan int(30), cods int(30),mens varchar(100))
Update Adopcion set cod_ani=cdan, cod_seg=cods, mensaje=mens where codigo_adopcion=cod;

Create procedure VetEliminar_Adopcion( cod int(30))
Delete from Adopcion where codigo_adopcion=cod;

/*ANIMAL*/

/*Insertar Animal*/
create procedure inser_animal_Admin(nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255),tama varchar(30),gen varchar(30),col varchar(30))
insert into animal (nombre_animal,tipo_animal,edad_animal,raza_animal,foto,tamaño,genero,color) values (nombre,tipo,edad,raza,imagen,tama,gen,col);
-- drop procedure inser_animal_Admin;

/*Modificar Animal*/
create procedure act_animal_Admin(codigo int(30),nombre varchar(50), tipo varchar(50),edad varchar(5),raza varchar(30))
update animal set nombre_animal=nombre,tipo_animal=tipo,edad_animal=edad,raza_animal=raza where codigo_animal=codigo;

/*Borrar Animal*/
create procedure bor_animal_Admin(codigo int(30))
delete from animal where codigo_animal=codigo;


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
Create procedure FunInsertar_Eventos(fec date, lug varchar(45), dur text,des varchar(255))
insert into Jornada (fecha, lugar, duracion,descripcion) values(fec,lug,dur,des) ;


/*Modificar Eventos*/
Create procedure FunModificar_Eventos( cod int(30), fec date, lug varchar(45), dur time, des varchar(255))
Update jornada set fecha=fec, lugar=lug, duracion=dur, descripcion=des where codigo_jornada=cod; 
-- drop procedure FunModificar_Eventos;

/*Eliminar Eventos*/
Create procedure FunEliminar_Eventos( cod int(30))
Delete from Jornada where codigo_jornada=cod;

/*FUNCIONARIO*/

/*Insertar Funcionario*/
create procedure Insertar_Funcionario(cedula varchar(30),telefono varchar(30),nombre varchar(50),correo varchar(100),rol int(30))
insert into funcionario  (cedula_funcionario,telefono_funcionario,nombre_funcionario,correo_funcionario,rol3)values(cedula,telefono,nombre,correo,rol);
/*Modificar Funcionario*/
Create procedure Modificar_Funcionario( ced varchar(30), tel varchar(30), nom varchar(50), cor varchar(100), cla varchar(100))
Update Funcionario set telefono_funcionario=tel, nombre_funcionario=nom, correo_funcionario=cor, clave=cla where cedula_funcionario=ced; 

/*Eliminar Funcionario*/
Create procedure Eliminar_Funcionario( ced varchar(30))
Delete from Funcionario where cedula_funcionario=ced;

/*MASCOTA*/

/*Insertar Mascota*/
create procedure usuario_mascota_inser(nom_mas varchar(30), descen varchar(30), esta_mas varchar(45), tip_mas varchar(20), edad_mas varchar(20), raza_mas varchar(20), cedu varchar(20),fot varchar(250))
insert into mascota (nombre_mascota,descendencia,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced,foto) values (nom_mas, descen, esta_mas, tip_mas, edad_mas, raza_mas, cedu,fot) ;

/*Modificar Mascota*/
create procedure usuario_mascota_actu(cod_mas int(30), nom_mas varchar(30), descen varchar(30), esta_mas varchar(45), tip_mas varchar(20), edad_mas varchar(20), raza_mas varchar(20), cedu varchar(20))
update mascota set nombre_mascota=nom_mas, descendencia=descen, estado_mascota=esta_mas, tipo_mascota=tip_mas, edad_mascota=edad_mas, raza_mascota=raza_mas where ced=cedu and codigo_mascota=cod_mas;

/*Eliminar Mascota*/
create procedure usuario_mascota_elim(cedu varchar(20))
delete from mascota where ced=cedu;

/*POSTULACION*/

/*Insertar Postulacion*/
create procedure usuario_postulacion_inser(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20), cer_lab varchar(255), cedu varchar(20),con_ani int(30))
insert into postulacion (telefono_contacto,direccion_contacto,telefono_fijo,certificado_laboral,cedu,codigo_animal) values (tel_con, dir_con, tel_fij, cer_lab, cedu,con_ani);

/*Modificar Postulacion*/
create procedure usuario_postulacion_actu(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20), cer_lab varchar(255), cedul varchar(20),cod_post int(30))
update postulacion set telefono_contacto=tel_con,direccion_contacto=dir_con,telefono_fijo=tel_fij,certificado_laboral=cer_lab where cedu=cedul and codigo_postulacion=cod_post;

/*Eliminar Postulacion*/
create procedure usuario_postulacion_elim(codpost varchar(20))
delete from postulacion where codigo_postulacion=codpost;

/*SEGUIMIENTO*/

/*Insertar Seguimiento*/
Create procedure FunInsertar_Seguimiento(cod int(30), cdp int(30))
insert into seguimiento (cod_postula) values(cdp);

/*Modificar Seguimiento*/
Create procedure FunModificar_Seguimiento( cod int(30), cdp int(30))
Update Seguimiento set cod_postula=cdp where codigo_Seguimiento=cod; 

/*Eliminar Seguimiento*/
Create procedure FunEliminar_Seguimiento( cod int(30))
Delete from Seguimiento where codigo_Seguimiento=cod;

/*VETERINARIA*/

/*Insertar Veterinaria*/
create procedure inser_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50),clave varchar(50),rol int(30))
insert into veterinaria (nit_veterinaria,telefono_veterinaria,nombre_veterinaria,direccion_veterinaria,clave,rol2) values(nit,tel,nombre,dir,clave,rol);

/*Modificar Veterinaria*/
create procedure act_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50),cla varchar(50))
update veterinaria set telefono_veterinaria=tel,nombre_veterinaria=nombre,direccion_veterinaria=dir,clave=cla where nit_veterinaria=nit;

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
call inser_us_vet('8901',3);

/*CONSULTA 1 */
select nombre,cedula,correo,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula = mascota.ced
where tipo_mascota ='perro';

/*CONSULTA 2 */
select nombre,cedula,correo,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula = mascota.ced
where tipo_mascota ='gato';



/*CONSULTA 3 */
select codigo_mascota,nombre_mascota,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced as Cedula,fecha,lugar,duracion from mascota
inner join asiste on mascota.codigo_mascota =asiste.cod_mascota
inner join jornada on asiste.cod_jornada=jornada.codigo_jornada
where duracion>'03:00:00';

/*CONSULTA 4 */
select nombre_animal,edad_animal,raza_animal from animal
where tipo_animal='perro';

/*CONSULTA 5*/
select nombre_animal,edad_animal,raza_animal from animal
where tipo_animal='gato';

/*CONSULTA 6*/
select codigo_mascota,nombre_mascota,estado_mascota,tipo_mascota,edad_mascota,raza_mascota,ced as Cedula,fecha,lugar,duracion from mascota
inner join asiste on mascota.codigo_mascota =asiste.cod_mascota
inner join jornada on asiste.cod_jornada=jornada.codigo_jornada
where lugar='parque las aguas';
 
 /*CONSULTA 7*/
select nombre,direccion,telefono,descripcion_denuncia from ciudadano
inner join denuncia on ciudadano.cedula=denuncia.cedul_ciudadano
where descripcion_denuncia='abandono';

/*CONSULTA 8*/
select lugar,duracion,fecha from jornada
where month(fecha)='02';

/*CONSULTA 9*/
select fecha_denuncia,descripcion_denuncia,cedul_ciudadano ,fecha_respuesta from denuncia
inner join respuesta  on denuncia.codigo_denuncia=respuesta.cod_denu 
where month(fecha_respuesta)='06';

/*CONSUTA 10*a/
select nombre,telefono,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula=mascota.ced
where estado_mascota='operado';
insert into usuarios(nom_usuario,clave,rol5) values ('AlexElCapo','1111',4), ('JuanMakia','0000',4), ('72471422','0000',2), ('52849421','0000',2), ('68470826','0000',2), ('98374971','0000',2), ('41683731','0000',2), ('811192822-A','veterinaria',3), ('811192822-B','veterinaria',3), ('811192822-C','veterinaria',3), ('811192822-D','veterinaria',3), ('Alf','4321',1)
