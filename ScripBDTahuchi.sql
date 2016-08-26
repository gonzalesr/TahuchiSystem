CREATE DATABASE BDTAHUCHI
GO

USE BDTAHUCHI

CREATE TABLE Privilegio
(
	Priv_Codigo int not null primary key,
	Priv_Desc nvarchar(50)
);

CREATE TABLE TipoUsuario
(
	TipoUsu_Codigo int not null primary key,
	TipoUsu_Nombre nvarchar(50) not null
);

CREATE TABLE TipoUsuario_Privilegio
(
	TipoUsu_Codigo int not null,
	Priv_Codigo int not null,
	Primary Key(TipoUsu_Codigo, Priv_Codigo), 
	foreign key(TipoUsu_Codigo) references TipoUsuario(TipoUsu_Codigo),
	foreign key(Priv_Codigo) references Privilegio(Priv_Codigo)
);
CREATE TABLE Usuario
(
	Usu_Codigo int not null primary key,
	Usu_Login nvarchar(50) not null,
	Usu_Password nvarchar(100) not null,
	Usu_Nombre nvarchar(100)not null,
	Usu_Dirección nvarchar(250),
	Usu_Telefono nvarchar(50),
	Usu_FechaRegistro datetime not null,
	Usu_Estado int not null,
	TipoUsu_Codigo int not null,
	foreign key(TipoUsu_Codigo) references TipoUsuario(TipoUsu_Codigo)
	
);
CREATE TABLE Bitacora
(
	Bitac_Codigo int not null primary key,
	Bitac_FechaHora datetime not null,
	Bitac_Tabla nvarchar (50) not null,
	Bitac_Registro nvarchar(250) not null,
	Usu_Codigo int not null,
	foreign key (Usu_Codigo) references Usuario(Usu_Codigo)
	
);

CREATE TABLE CategoriaAlumno
(
	Cat_Codigo int not null primary key,
	Cat_Nombre nvarchar(100) not null,
	Cat_Edad int not null
);

CREATE TABLE CondicionPago
(
	CP_Codigo int not null primary key,
	CP_Nombre nvarchar(100) not null
);

CREATE TABLE Alumno
(
	Alu_Codigo int not null primary key,
	Alu_Nombre nvarchar(100) not null,
	Alu_ApePat nvarchar(100) not null,
	Alu_ApeMat nvarchar(100),
	Alu_Sexo nvarchar(50),
	Alu_FechaNac date not null,
	Alu_Direccion nvarchar(100) not null,
	Alu_Telefono nvarchar(100) not null,
	Alu_Apoderado nvarchar(100) not null,
	Alu_Edad int not null,
	Alu_Peso decimal(4,2),
	Alu_Estado int not null,
	Alu_Posicion nvarchar(50) not null,
	Alu_FechaIng datetime not null,
	Cat_Codigo int not null,
	CP_Codigo int not null,
	
	foreign key (Cat_Codigo) references CategoriaAlumno(Cat_Codigo),
	foreign key (CP_Codigo) references CondicionPago(CP_Codigo)
);


CREATE TABLE Patrocinador
(
	Patroc_Codigo int not null primary key,
	Patroc_Nombre nvarchar(100) not null
);

CREATE TABLE Beca
(
	Beca_Codigo int not null primary key,
	Beca_Nombre nvarchar(100) not null,
	Beca_FechaInicio datetime not null,
	Beca_FechaFin datetime not null,
	Patroc_Codigo int not null,
	Alu_Codigo int,
	foreign key (Patroc_Codigo) references Patrocinador(Patroc_Codigo),
	foreign key (Alu_Codigo) references Alumno (Alu_Codigo)
);

CREATE TABLE CategoriaTecnico
(
	CaTec_Codigo int not null primary key,
	CaTec_Nombre nvarchar(100) not null
);

CREATE TABLE Tecnico
(
	Tec_Codigo int not null primary key,
	Tec_CI nvarchar(50) not null,
	Tec_Nombre nvarchar(100) not null,
	Tec_ApePat nvarchar(100) not null,
	Tec_ApeMat nvarchar(100),
	Tec_FechaNac datetime not null,
	Tec_Sexo nvarchar(50) not null,
	Tec_Telefono nvarchar(50) not null,
	Tec_Direccion nvarchar(100) not null,
	Tec_FechaIng datetime not null,
	Tec_Estado int not null,
	CatTec_Codigo int not null,
	
	foreign key (CatTec_Codigo) references CategoriaTecnico(CaTec_Codigo)
);

CREATE TABLE Horario
(
	Horario_Codigo int not null primary key,
	Horario_Dias nvarchar(100) not null
);

CREATE TABLE LugarEntrenamiento
(
	LE_Codigo int not null primary key,
	LE_Nombre nvarchar(100) not null
);

CREATE TABLE CursoTemporada
(
	Curso_Codigo int not null primary key,
	Curso_Nombre nvarchar(100) not null,
	LE_Codigo int not null,
	Horario_Codigo int not null, 
	Tec_Codigo int not null,
	foreign Key(LE_Codigo) references LugarEntrenamiento(LE_Codigo),
	foreign Key(Horario_Codigo) references Horario(Horario_Codigo),
	foreign Key(Tec_Codigo) references Tecnico(Tec_Codigo)
);

CREATE TABLE AlumnoCurso
(
	Curso_Codigo int not null,
	Alu_Codigo int not null,
	Primary Key (Curso_Codigo, Alu_Codigo),
	foreign key (Curso_Codigo) references CursoTemporada (Curso_Codigo),
	foreign key (Alu_Codigo) references Alumno (Alu_Codigo)
);

CREATE TABLE MesCurso
(
	Mes_Codigo int not null primary key,
	Mes_Nombre nvarchar(50) not null
);

CREATE TABLE CursoMes
(
	Curso_Codigo int not null,
	Mes_Codigo int not null,
	Primary Key (Curso_Codigo, Mes_Codigo),
	foreign Key (Curso_Codigo) references CursoTemporada(Curso_Codigo),
	foreign Key (Mes_Codigo) references MesCurso(Mes_Codigo)
);

CREATE TABLE Pago
(
	Pago_Codigo int not null primary key,
	Pago_Fecha datetime not null,
	Pago_Descuento money not null,
	Pago_Monto money not null,
	Pago_Glosa nvarchar(250),
	Usu_Codigo int not null,
	foreign key (Usu_Codigo) references Usuario (Usu_Codigo)
);

CREATE TABLE DetallePago
(
	Mes_Codigo int not null,
	Pago_Codigo int not null,
	Detalle_Precio money not null,
	Detalle_Cantidad int not null,
	Detalle_PrecioTotal money not null,
	Primary Key (Mes_Codigo, Pago_Codigo),
	foreign key (Mes_Codigo) references MesCurso(Mes_Codigo),
	foreign key (Pago_Codigo) references Pago (Pago_Codigo)
);





