create database Proyecto;
use Proyecto;
-- drop database Proyecto;

create table roles
(rol int(30) primary key,
nombre_rol varchar(50)
);

insert into roles(rol,nombre_rol)
values(1,'Administrador'),(2,'Funcionario'),(3,'Veterinaria'),(4,'Ciudadano');


create table registro_usuario
(nombre_usuario varchar(50) primary key,
clave varchar(50),
rol1 int(30),
constraint ro foreign key (rol1) references roles(rol) on delete cascade on update cascade
);

insert into registro_usuario(nombre_usuario,clave,rol1)
values('AlexElCapo','1111',4),
('JuanMakia','0000',4);

create table ciudadano
(cedula varchar (50) primary key , 
nombre varchar (45),
telefono varchar (20),
direccion varchar(45),
correo varchar (45),
usuario_ciu varchar(50),
constraint usu foreign key (usuario_ciu) references registro_usuario(nombre_usuario) on delete cascade on update cascade
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
duracion time);

alter table jornada add descripcion varchar(255);

insert into jornada(fecha,lugar,duracion)
values
('2018/05/16','Parque Central','02:00:00'),
('2018/02/23','Parque de Mosquera','04:00:00'),
('2018/01/10','Parque Mi Mascota','03:00:00'),
('2017/04/15','Parque Las Aguas','04:30:00'),
('2019/12/10','Parque Las Aguas','06:00:00'),
('2018/03/25','Parque Sabana','04:20:00'),
('2018/09/30','Parque Mi Mascota','05:00:00'),
('2018/07/16','Parque Mi Mascota','06:00:00'),
('2018/01/27','Parque Sabana','05:00:00'),
('2018/02/10','Parque Central','04:00:00');


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

drop table postulacion;
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
clave varchar(50),
rol2 int(30),	
constraint ro2 foreign key (rol2) references roles(rol) on delete cascade on update cascade
);

-- drop table veterinaria;

insert into veterinaria(nit_veterinaria,telefono_veterinaria,nombre_veterinaria,direccion_veterinaria,clave,rol2)
values 
('811192822-A','3137425832','Mis patitas','Calle 14#32-45','veterinaria',3),
('811192822-B','3142315647','Mis huellitas','Calle 13#05-45','veterinaria',3),
('811192822-C','3153216798','Mis mascotas','Calle 23#34-25','veterinaria',3),
('811192822-D','3113216547','Guau y miau','Calle 11#13-22','veterinaria',3);

create table funcionario (
cedula_funcionario varchar(50) primary key,
telefono_funcionario varchar(30) not null,
nombre_funcionario varchar (50) not null,
correo_funcionario varchar (100) not null,
clave varchar(100),
rol3 int(30),
constraint ro3 foreign key (rol3) references roles(rol) on delete cascade on update cascade
);

-- drop table funcionario;

insert into funcionario(cedula_funcionario,telefono_funcionario,nombre_funcionario,correo_funcionario,clave,rol3)
values
('72471422','3216440371','Manuel','manuelito@gmail.com','0000',2),
('52849421','3135487561','Lucas','luquitas@gmail.com','0000',2),
('68470826','3116548712','Juan','juansito@gmail.com','0000',2),
('98374971','3135487654','Ivan','ivansito@gmail.com','0000',2),
('41683731','3106547875','Sergio','sergiofon@gmail.com','0000',2);

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


CREATE TABLE admin(
    usuario VARCHAR(50) primary key,
    clave VARCHAR(50) ,
    rol4 int(30),
    constraint ro4 foreign key (rol4) references roles(rol) on delete cascade on update cascade
);

insert into admin(usuario,clave,rol4) values
('Alf','4321',1);

CREATE TABLE usuarios(
    nom_usuario VARCHAR(50) primary key,
    clave VARCHAR(50),
    rol5 int(30),
    constraint ro5 foreign key (rol5) references roles(rol) on delete cascade on update cascade,
    constraint us1 foreign key (nom_usuario) references registro_usuario(nombre_usuario) on delete cascade on update cascade,
    constraint us2 foreign key (nom_usuario) references funcionario(cedula_funcionario) on delete cascade on update cascade,
    constraint us3 foreign key (nom_usuario) references veterinaria(nit_veterinaria) on delete cascade on update cascade,
    constraint us4 foreign key (nom_usuario) references admin(usuario) on delete cascade on update cascade
);

insert into usuarios(nom_usuario,clave,rol5) values
('AlexElCapo','1111',4),
('72471422','0000',2),
('811192822-A','veterinaria',3),
('Alf','4321',1);

create table usuario_funcionario
(cedula_fun varchar (50) primary key,
nombre_usuario varchar(50),
clave varchar(50),
rol2 int(30),
constraint rof foreign key (rol2) references roles(rol) on delete cascade on update cascade
);
insert into usuario_funcionario(cedula_fun,nombre_usuario,clave,rol2)
values('9907162019','AlexElCapo','1111',2),
('1001263254','JuanMakia','0000',2);
create table usuario_veterinaria
(
nombre_usuario varchar(50) primary key,
clave varchar(50),
rol3 int(30),
constraint rov foreign key (rol3) references roles(rol) on delete cascade on update cascade
);
insert into usuario_veterinaria(nombre_usuario,clave,rol3)
values('AlexElCapo','1111',3),
('JuanMakia','0000',3);


-- drop table usuarios;




/*Procedures Administrador (Ciudadanos):*/
/*Insertar Ciudadano*/
create procedure insertar_usuario_Admin(cedula varchar(50), nombre varchar(50),pass varchar(50),rol int(30))
insert into registro_usuario values(cedula,nombre,pass,rol);
call insertar_usuario_Admin('13456','Prueba','123',4);

/*Actualizar Clave Ciudadano*/
create procedure actualizar_usuario_Admin(cedula varchar(50),pass varchar(50))
update registro_usuario set clave=pass where cedula_ciu=cedula;
call actualizar_usuario_Admin('13456','1234');

/*Borrar Ciudadano*/
create procedure borrar_usuario_Admin(cedula varchar(50))
delete from registro_usuario where cedula_ciu=cedula;
call borrar_usuario_Admin('13456');

/*Procedures Administrador (Usuarios)*/
/*Insertar Usuario*/
create procedure inser_usuario_Admin(cedu varchar(50), nom varchar(45),tel varchar(20), dir varchar(45), cor varchar(50),us varchar(50))
insert into ciudadano values(cedu,nom,tel,dir,cor,us);
call inser_usuario_Admin('13456','Sujeto','31371','Prados','s@gmail.com','JuanMakia');

/*Actualizar Usuario*/
create procedure act_usuario_Admin(cedu varchar(50),nom varchar(45),tel varchar(20), dir varchar(45),cor varchar(50))
update ciudadano set nombre=nom,telefono=tel,direccion=dir,correo=cor where cedula=cedu;
call act_usuario_Admin('13456','Sujeto de prueba','313712','Prados1','s1@gmail.com');

/*Borrar Usuario*/
create procedure bor_usuario_Admin(cedu varchar(50))
delete from ciudadano where cedula=cedu;
call bor_usuario_Admin('13456');


/*Procedures Administrador(Animal)*/
/*Insertar Animal*/
create procedure inser_animal_Admin(nombre varchar(50),tipo varchar(50),edad varchar(5),raza varchar(30),imagen varchar(255))
insert into animal (nombre_animal,tipo_animal,edad_animal,raza_animal,foto) values (nombre,tipo,edad,raza,imagen);
call inser_animal_Admin('Prueba','Gato','5','Persa','');
-- drop procedure inser_animal_Admin;

/*Modificar Animal*/
create procedure act_animal_Admin(codigo int(30),nombre varchar(50), tipo varchar(50),edad varchar(5),raza varchar(30))
update animal set codigo_animal=codigo,nombre_animal=nombre,tipo_animal=tipo,edad_animal=edad,raza_animal=raza where codigo_animal=codigo;
call act_animal_Admin(11,'Doroty','Hembra','5','Doberman');

/*Borrar Animal*/
create procedure bor_animal_Admin(codigo int(30))
delete from animal where codigo_animal=codigo;
call bor_animal_Admin(11);

/*Procedures Administrador(Mascota)*/
/*Insertar Mascota*/
create procedure inser_mascota_Admin(codigo int(30),nombre varchar(30),des varchar(30),estado varchar(45),tipo varchar(20),edad varchar(20),raza varchar(20),ce varchar(20))
insert into mascota values(codigo,nombre,des,estado,tipo,edad,raza,ce);
call inser_mascota_Admin(3,'Mateo','Puro','Sano','Macho','3','Pitbull','13456'); 

/**Modificar Mascota*/
create procedure act_mascota_Admin(codigo int(30),nombre varchar(30),des varchar(30),estado varchar(45),tipo varchar(20),edad varchar(20),raza varchar(20),ce varchar(20))
update mascota set codigo_mascota=codigo,nombre_mascota=nombre,descendencia=des,estado_mascota=estado,tipo_mascota=tipo,edad_mascota=edad,raza_mascota=raza,ced=ce where codigo_mascota=codigo; 
call act_mascota_Admin(3,'Mateus','Puro','Enfermo','Macho','4','Pitbull','13456');

/*Borrar Mascota*/
create procedure bor_mascota_Admin(codigo int(30))
delete from mascota where codigo_mascota=codigo;
call bor_mascota_Admin(3);

/*Procedures Administrador(Admin)*/
/*Insertar Administrador*/
create procedure inser_admin_Admin(us varchar(50),cla varchar(50))
insert into admin values(us,cla);
call inser_admin_Admin('Kno','123');

/*Modificar Administrador*/
create procedure act_admin_Admin(us varchar(50),cla varchar(50))
update admin set clave=cla where usuario=us;
call act_admin_Admin('Alf','1234');

/*Eliminar Administrador*/
create procedure bor_admin_Admin(us varchar(50))
delete from usuarios where usuario=us;
call bor_admin_Admin('Kno');

/*Procedures Administrador(Veterinaria)*/
/*Insertar Veterinaria*/
create procedure inser_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50),clave varchar(50))
insert into veterinaria values(nit,tel,nombre,dir,clave);
call inser_veter_Admin('A341','313341','Pies Descalzos','Prados','123');

/*Modificar Veterinaria*/
create procedure act_veter_Admin(nit varchar(30),tel varchar(30),nombre varchar(50),dir varchar(50),cla varchar(50))
update veterinaria set telefono_veterinaria=tel,nombre_veterinaria=nombre,direccion_veterinaria=dir,clave=cla where nit_veterinaria=nit;
call act_veter_Admin('A341','3133412','Pies','Prados1','1234');

/*Eliminar Veterinaria*/
create procedure bor_veter_Admin(nit varchar(30))
delete from veterinaria where nit_veterinaria=nit;
call bor_veter_Admin('A341');


/*Procedures Administrador (Funcionario)*/
/*Insertar Funcionario*/
create procedure inser_fun_Admin(cedula varchar(30),telefono varchar(30),nombre varchar(50),correo varchar(100),clave varchar(100))
insert into funcionario  values(cedula,telefono,nombre,correo,clave);
call inser_fun_Admin('101012','3130987','Antonio','Antonio@gmail.com','1313');

/*Modificar Funcionario*/
Create procedure Modificar_Funcionario( ced varchar(30), tel varchar(30), nom varchar(50), cor varchar(100), cla varchar(100))
Update Funcionario set telefono_funcionario=tel, nombre_funcionario=nom, correo_funcionario=cor, clave=cla where cedula_funcionario=ced; 

call Modificar_Funcionario('72471422','3216440371','Manuel','manuelito@gmail.com','0000');


/*Eliminar Funcionario*/
Create procedure Eliminar_Funcionario( ced varchar(30))
Delete from Funcionario where cedula_funcionario=ced;

call Eliminar_Funcionario();



-- USUARIO

-- Veterinaria

create procedure usuario_veter()
select * from veterinaria; 

call usuario_veter;

-- Animal

create procedure usuario_animal()
select * from animal; 

call usuario_animal;

-- Mascota

create procedure usuario_mascota_inser(cod_mas int(30), nom_mas varchar(30), descen varchar(30), esta_mas varchar(45), tip_mas varchar(20), edad_mas varchar(20), raza_mas varchar(20), cedu varchar(20))
insert into mascota values (cod_mas, nom_mas, descen, esta_mas, tip_mas, edad_mas, raza_mas, cedu);

call usuario_mascota_inser(3,'Puto','Puro','Bien','Perro','15 meses','Pitbull',1);

create procedure usuario_mascota_consul(cedu varchar(20))
select * from mascota where ced=cedu;

call usuario_mascota_consul(1);

create procedure usuario_mascota_actu(cod_mas int(30), nom_mas varchar(30), descen varchar(30), esta_mas varchar(45), tip_mas varchar(20), edad_mas varchar(20), raza_mas varchar(20), cedu varchar(20))
update mascota set codigo_mascota=cod_mas, nombre_mascota=nom_mas, descendencia=descen, estado_mascota=esta_mas, tipo_mascota=tip_mas, edad_mascota=edad_mas, raza_mascota=raza_mas where ced=cedu;

call usuario_mascota_actu(3,'Kayn','Puro','Bien','Perro','15 meses','Pitbull',1);

create procedure usuario_mascota_elim(cedu varchar(20))
delete from mascota where ced=cedu;

call usuario_mascota_elim(1);

-- Denuncia

create procedure usuario_denuncia_inser(fec_den date, descrip varchar(150), cedul varchar(20))
insert into denuncia (fecha_denuncia,descripcion_denuncia,cedul_ciudadano) values (fec_den, descrip, cedul);

call usuario_denuncia_inser('2018/09/17','Puto',1);

-- Comentarios

create procedure usuario_comentarios_inser(fec date, cuerpo varchar(255), adop int(30))
insert into comentarios(fecha_comentario, cuerpo, cod_adop) values (fec, cuerpo, adop);

call usuario_comentarios_inser('2018/03/12','proceso exitoso',1);

create procedure usuario_comentarios_consul(cod int(30))
select * from comentarios where codigo_comentario=cod;

call usuario_comentarios_consul(1);

create procedure usuario_comentarios_actu(fec date, cuerpo varchar(255), adop int(30),cod int(30))
update comentarios set fecha_comentario=fec, cuerpo=cuerpo, cod_adop=adop where codigo_comentario=cod;

call usuario_comentarios_actu('2018/03/12','proceso exitoso',2,1);

create procedure usuario_comentarios_elim(cod int(30))
delete from comentarios where codigo_comentario=cod;

call usuario_comentarios_elim(1);

-- Eventos

create procedure usuario_eventos()
select * from jornada; 

call usuario_eventos;

-- Adopciones

create procedure usuario_adopcion()
select * from adopcion; 

call usuario_adopcion;

-- Postulacion

create procedure usuario_postulacion_inser(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20), cer_lab varchar(255), cedu varchar(20),con_ani int(30))
insert into postulacion (telefono_contacto,direccion_contacto,telefono_fijo,certificado_laboral,cedu,codigo_animal) 
values (tel_con, dir_con, tel_fij, cer_lab, cedu,con_ani);

call usuario_postulacion_inser('3112312324','Calle 15 # 10-25','8226512','','1001263254',4);

create procedure usuario_postulacion_consul(cedul varchar(20))
select * from postulacion where cedu=cedul;

call usuario_postulacion_consul(1);

create procedure usuario_postulacion_actu(tel_con varchar(20), dir_con varchar(20), tel_fij varchar(20), cer_lab varchar(255), cedul varchar(20),cod_post int(30))
update postulacion set telefono_contacto=tel_con,direccion_contacto=dir_con,telefono_fijo=tel_fij,certificado_laboral=cer_lab,cedu=cedul where codigo_postulacion=cod_post;

call usuario_postulacion_actu('3112312324','Calle 15 # 10-20','8226512','','1',4);

create procedure usuario_postulacion_elim(cedul varchar(20))
delete from postulacion where cedu=cedul;

call usuario_postulacion_elim(1);

-- Seguimiento

create procedure usuario_seguimiento()
select * from seguimiento; 

call usuario_seguimiento();

/*VETERINARIA*/

Create procedure Consultar_Veterinaria()
Select * from  Veterinaria ;

call Consultar_Veterinaria();

Create procedure Modificar_Veterinaria( nit varchar(30), tel varchar(30), nom varchar(50), dir varchar(50), cla varchar(50))
Update Veterinaria set telefono_veterinaria=tel, nombre_veterinaria=nom, direccion_veterinaria=dir, clave=cla where nit_veterinaria=nit;

call Modificar_Veterinaria('811192822-A','3137425832','Veterinaria','Calle 14#32-45','veterinaria');

Create procedure Eliminar_Veterinaria( nit varchar(30))
Delete  from Veterinaria  where nit_veterinaria=nit;

call Eliminar_Veterinaria('');


/* VETERINARIA-ANIMAL*/

Create procedure VetInsertar_Animal(cod int(30), nom varchar(50), tip varchar(50), eda varchar(5), raz varchar(30))
insert into Animal
values(codigo_animal, tipo_animal, edad_animal, raza_animal);

call VetInsertar_Animal();

Create procedure VetConsultar_Animal()
Select * from  Animal ;

call VetConsultar_Animal();

Create procedure VetModificar_Animal( cod int(30), nom varchar(50), tip varchar(50), eda varchar(5), raz varchar(30))
Update Animal set nombre_animal=nom, tipo_animal=tip, edad_animal=eda, raza_animal=raz where codigo_animal=cod;

call VetModificar_Animal(1,'Kayn','Perro','1','Beagle');

Create procedure VetEliminar_Animal( cod int(30))
Delete from Animal where codigo_animal=cod;

call VetEliminar_Animal('');


/* VETERINARIA-MASCOTA */

Create procedure VetInsertar_Mascota(cod int(30), nom varchar(50), tip varchar(50), eda varchar(5), raz varchar(30))
insert into Mascota
values(codigo_animal, tipo_animal, edad_animal, raza_animal);

call VetInsertar_Mascota();

Create procedure VetConsultar_Mascota()
Select * from  Mascota ;

call VetConsultar_Mascota();

Create procedure VetModificar_Mascota( cod int(30), nom varchar(45), des varchar(30), est varchar(45), tip varchar(20), eda varchar(20), raz varchar(20), ce varchar(20))
Update Mascota set nombre_mascota=nom, descendencia=des, estado_mascota=est ,tipo_mascota=tip, edad_Mascota=eda, raza_mascota=raz, ced=ce where codigo_mascota=cod;

call VetModificar_Mascota(2,'garen','puro','Sano','gato','2','persa','1001263254');

Create procedure VetEliminar_Mascota( cod int(30))
Delete from Mascota where codigo_mascota=cod;

call VetEliminar_Mascota();


/* VETERINARIA-DENUNCIAS*/

Create procedure VetInsertar_Denuncias(cod int(30), fec date, des varchar(150), ced varchar(20))
insert into Denuncias
values(codigo_denuncia, fecha_denuncia, descripcion_denuncia, cedul_ciudadano);

call VetInsertar_Denuncias();

Create procedure VetConsultar_Denunicas()
Select * from  Denuncia ;

call VetConsultar_Denunicas;

Create procedure VetModificar_Denuncias( cod int(30), fec date, des varchar(150), ced varchar(20))
Update Denuncia set fecha_denuncia=fec, descripcion_denuncia=des, cedul_ciudadano=ced where codigo_denuncia=cod; 

call VetModificar_Denuncias(2,'2018/04/26','abandono','1001263254');

/* VETERINARIA-COMENTARIOS */

Create procedure VetInsertar_Comentarios(cod int(30), fec date, cue varchar(255), cda int(30))
insert into Comentarios
values(codigo_comentarios, fecha_comentario, cuerpo_comentario, cod_adop);

call VetInsertar_Comentarios();

Create procedure VetConsultar_Comentarios()
Select * from  Comentarios ;

call VetConsultar_Comentarios;

Create procedure VetModificar_Comentarios( cod int(30), fec date, cue varchar(255), cda int(30))
Update Comentarios set fecha_comentario=fec, cuerpo=cue, cod_adop=cda where codigo_comentario=cod; 

call VetModificar_Comentarios(01,'2018/03/12','proceso exitoso',1);

Create procedure VetEliminar_Comentarios( cod int(30))
Delete from Comentarios where codigo_comentario=cod;

call VetEliminar_Comentarios();

/* VETERINARIA-EVENTOS(jornada) */

Create procedure VetConsultar_Jornada()
Select * from  Jornada ;

call VetConsultar_Jornada;

/* VETERINARIA-ADOPCIONES */

Create procedure VetInsertar_Adopcion(cod int(30), cdan int(30), cods int(30))
insert into Adopcion
values(codigo_adopcion, codigo_ani, codigo_seg);

call VetInsertar_Adopcion();

Create procedure VetConsultar_Adopcion()
Select * from  Adopcion ;

call VetConsultar_Adopcion;

Create procedure VetModificar_Adopcion( cod int(30), cdan int(30), cods int(30))
Update Adopcion set cod_ani=cdan, cod_seg=cods where codigo_adopcion=cod; 

call VetModificar_Adopcion(1,5,1);

Create procedure VetEliminar_Adopcion( cod int(30))
Delete from Adopcion where codigo_adopcion=cod;

call VetEliminar_Adopcion();




/* FUNCIONARIO-USUARIO(Ciudadano) */

Create procedure FunConsultar_Usuario()
Select * from  Ciudadano ;

call FunConsultar_Usuario;

/* FUNCIONARRIO-VETERINARIA */

Create procedure FunConsultar_Veterinaria()
Select * from  Veterinaria ; 

call FunConsultar_Veterinaria;

/* FUNCIONARIO */

Create procedure Consultar_Funcionario()
Select * from  Funcionario ;

call Consultar_Funcionario;

Create procedure Modificar_Funcionario( ced varchar(30), tel varchar(30), nom varchar(50), cor varchar(100), cla varchar(100))
Update Funcionario set telefono_funcionario=tel, nombre_funcionario=nom, correo_funcionario=cor, clave=cla where cedula_funcionario=ced; 

call Modificar_Funcionario('72471422','3216440371','Manuel','manuelito@gmail.com','0000');

Create procedure Eliminar_Funcionario( ced varchar(30))
Delete from Funcionario where cedula_ciudadano=ced;

call Eliminar_Funcionario();

/* FUNCIONARIO-DENUNCIAS */

Create procedure FunConsultar_Denuncia()
Select * from  Denuncia ;

call FunConsultar_Denuncia;

Create procedure FunModificar_Denuncia( cod int(30), fec date, des varchar(150), var varchar(20))
Update Denuncia set fecha_denuncia=fec, descripcion_denuncia=des where codigo_denuncia=cod; 

call FunModificar_Denuncia(2,'2018/04/26','abandono','1001263254');

Create procedure FunEliminar_Denuncia( cod int(30))
Delete from Denuncia where codigo_denuncia=cod;

call Eliminar_Funcionario();

/* FUNCIONARIO-COMENTARIOS */

Create procedure FunConsultar_Comentarios()
Select * from  Comentarios ;

call FunConsultar_Comentarios;

Create procedure FunEliminar_Comentarios( cod int(30))
Delete from Comentarios where codigo_comentario=cod;

call FunEliminar_Comentarios();

/* FUNCIONARIO-EVENTOS(Jornada) */

Create procedure FunInsertar_Eventos(cod int(30), fec date, lug varchar(45), dur time)
insert into Jornada
values(codigo_jornada, fecha, lugar, duracion);

call FunInsertar_Eventos();

Create procedure FunConsultar_Eventos()
Select * from  Jornada ;

call FunConsultar_Eventos;

Create procedure FunModificar_Eventos( cod int(30), fec date, lug varchar(45), dur time)
Update Jornada set fecha=fec, lugar=lug, duracion=dur where codigo_jornada=cod; 

call FunModificar_Eventos(1,'2018/05/16','Parque Central','02:00:00');

Create procedure FunEliminar_Eventos( cod int(30))
Delete from Jornada where codigo_jornada=cod;

call FunEliminar_Eventos();

/* FUNCIONARIO-SEGUIMIENTO */

Create procedure FunInsertar_Seguimiento(cod int(30), cdp int(30))
insert into Seguimiento
values(codigo_seguimiento, codigo_postulacion);

call FunInsertar_Seguimiento();

Create procedure FunConsultar_Seguimiento()
Select * from  Seguimiento ;

call FunConsultar_Seguimiento;

Create procedure FunModificar_Seguimiento( cod int(30), cdp int(30))
Update Seguimiento set cod_postula=cdp where codigo_Seguimiento=cod; 

call FunModificar_Seguimiento(1,1);

Create procedure FunEliminar_Seguimiento( cod int(30))
Delete from Seguimiento where codigo_Seguimiento=cod;

call FunEliminar_Seguimiento();


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

/*CONSUTA 10*/
select nombre,telefono,nombre_mascota,raza_mascota from ciudadano
inner join mascota on ciudadano.cedula=mascota.ced
where estado_mascota='operado';
insert into usuarios(nom_usuario,clave,rol5) values ('AlexElCapo','1111',4), ('JuanMakia','0000',4), ('72471422','0000',2), ('52849421','0000',2), ('68470826','0000',2), ('98374971','0000',2), ('41683731','0000',2), ('811192822-A','veterinaria',3), ('811192822-B','veterinaria',3), ('811192822-C','veterinaria',3), ('811192822-D','veterinaria',3), ('Alf','4321',1)
