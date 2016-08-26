CREATE DATABASE tahuchi
GO

USE tahuchi

CREATE TABLE privilegio
(
	id int not null primary key,
	nombre nvarchar(50)
);

CREATE TABLE tipo_usuario
(
	id int not null primary key,
	nombre nvarchar(50) not null
);

CREATE TABLE tipo_usuario_privilegio
(
	tipo_usuario_id int not null,
	privilegio_id int not null,
	Primary Key(tipo_usuario_id, privilegio_id), 
	foreign key(tipo_usuario_id) references tipo_usuario(id),
	foreign key(privilegio_Id) references privilegio(id)
);
CREATE TABLE usuario
(
	id int not null primary key,
	login nvarchar(50) not null,
	password nvarchar(100) not null,
	nombre nvarchar(100)not null,
	direccion nvarchar(250),
	telefono nvarchar(50),
	fecha_registro datetime not null,
	estado int not null,
	tipo_usuario_id int not null,
	foreign key(tipo_usuario_id) references tipo_usuario(id)
	
);
CREATE TABLE bitacora
(
	id int not null primary key,
	fecha_hora datetime not null,
	tabla nvarchar (50) not null,
	registro nvarchar(250) not null,
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id)
	
);

CREATE TABLE categoria_alumno
(
	id int not null primary key,
	nombre nvarchar(100) not null,
	edad int not null
);

CREATE TABLE condicion_pago
(
	id int not null primary key,
	nombre nvarchar(100) not null
);

CREATE TABLE alumno
(
	id int not null primary key,
	nombre nvarchar(100) not null,
	apellido_paterno nvarchar(100) not null,
	apellido_materno nvarchar(100),
	sexo nvarchar(50),
	fecha_nacimiento date not null,
	direccion nvarchar(100) not null,
	telefono nvarchar(100) not null,
	apoderado nvarchar(100) not null,
	edad int not null,
	peso decimal(4,2),
	estado int not null,
	posicion nvarchar(50) not null,
	fecha_ingreso datetime not null,
	categoria_alumno_id int not null,
	condicion_pago_id int not null,
	
	foreign key (categoria_alumno_id) references categoria_alumno(id),
	foreign key (condicion_pago_id) references condicion_pago(id)
);


CREATE TABLE patrocinador
(
	id int not null primary key,
	nombre nvarchar(100) not null
);

CREATE TABLE beca
(
	id int not null primary key,
	nombre nvarchar(100) not null,
	fecha_inicio datetime not null,
	fecha_fin datetime not null,
	patrocinador_id int not null,
	alumno_id int,
	foreign key (patrocinador_id) references patrocinador(id),
	foreign key (alumno_id) references alumno(id)
);

CREATE TABLE categoria_tecnico
(
	id int not null primary key,
	nombre nvarchar(100) not null
);

CREATE TABLE tecnico
(
	id int not null primary key,
	carnet_identidad nvarchar(50) not null,
	nombre nvarchar(100) not null,
	apellido_paterno nvarchar(100) not null,
	apellido_materno nvarchar(100),
	fecha_nacimiento datetime not null,
	sexo nvarchar(50) not null,
	telefono nvarchar(50) not null,
	direccion nvarchar(100) not null,
	fecha_ingreso datetime not null,
	estado int not null,
	categoria_tecnico_id int not null,
	
	foreign key (categoria_tecnico_id) references categoria_tecnico(id)
);

CREATE TABLE horario
(
	id int not null primary key,
	dias nvarchar(100) not null
);

CREATE TABLE lugar_entrenamiento
(
	id int not null primary key,
	nombre nvarchar(100) not null
);

CREATE TABLE curso_temporada
(
	id int not null primary key,
	nombre nvarchar(100) not null,
	lugar_entrenamiento_id int not null,
	horario_id int not null, 
	tecnico_id int not null,
	foreign Key(lugar_entrenamiento_id) references lugar_entrenamiento(id),
	foreign Key(horario_id) references horario(id),
	foreign Key(tecnico_id) references tecnico(id)
);

CREATE TABLE alumno_curso_temporada_rel
(
	curso_temporada_id int not null,
	alumno_id int not null,
	Primary Key (curso_temporada_id, alumno_id),
	foreign key (curso_temporada_id) references curso_temporada(id),
	foreign key (alumno_id) references alumno(id)
);

CREATE TABLE mes_del_curso
(
	id int not null primary key,
	nombre nvarchar(50) not null
);

CREATE TABLE curso_temporada_mes_rel
(
	curso_temporada_id int not null,
	mes_id int not null,
	Primary Key (curso_temporada_id, mes_id),
	foreign Key (curso_temporada_id) references curso_temporada(id),
	foreign Key (mes_id) references mes_del_curso(id)
);

CREATE TABLE pago
(
	id int not null primary key,
	fecha datetime not null,
	descuento money not null,
	monto money not null,
	glosa nvarchar(250),
	usuario_id int not null,
	foreign key (usuario_id) references usuario(id)
);

CREATE TABLE detalle_pago
(
	id int not null,
	mes_id int not null,
	pago_id int not null,
	precio money not null,
	cantidad int not null,
	precio_total money not null,
	Primary Key (mes_id, pago_id),
	foreign key (mes_id) references mes_del_curso(id),
	foreign key (pago_id) references pago(id)
);





