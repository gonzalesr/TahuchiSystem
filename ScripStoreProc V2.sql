USE TAHUCHI
GO
--++++++++++++++++++++++++++++++++++++ ALUMNO +++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permitirá mostrar un listado de los alumnos.

IF OBJECT_ID('LISTAALUMNO') IS NOT NULL
	DROP PROC LISTAALUMNO
GO

CREATE PROC LISTAALUMNO
AS
BEGIN
	SELECT AL.id as CODIGO,
			AL.nombre + ' '+ AL.apellido_paterno AS NOMBRE,
			AL.telefono AS TELEFONO,
			AL.edad AS EDAD,
			AL.peso AS PESO,
			AL.posicion AS POSICION,
			AL.fecha_ingreso AS 'FECHA INGRESO'
			FROM Alumno AL
			JOIN categoria_alumno CAT ON CAT.id  =AL.categoria_alumno_id 
			JOIN condicion_pago CP ON CP.id = AL.condicion_pago_id 
END
GO

--Procedimiento almacenado que permite mostrar el código del último alumno
--registrado esto es para obtener el nuevo código del nuevo alumno

IF OBJECT_ID('ULTIMOALUMNO') IS NOT NULL
	DROP PROC ULTIMOALUMNO
GO

CREATE PROC ULTIMOALUMNO
AS
	SELECT TOP 1 id
			FROM Alumno
			ORDER BY id DESC
GO


--Procedimiento almacenado que permite insertar un nuevo alumno dentro de la base.

IF OBJECT_ID('NUEVOALUMNO') IS NOT NULL
	DROP PROC NUEVOALUMNO
GO

CREATE PROC NUEVOALUMNO(
	@CODIGO INT,
	@NOMBRE NVARCHAR(100),
	@APEPAT NVARCHAR(100),
	@APEMAT NVARCHAR(100),
	@SEXO NVARCHAR(50),
	@FECHANAC DATE,
	@DIRECCION NVARCHAR(100),
	@TELEFONO NVARCHAR(100),
	@APODERADO NVARCHAR(100),
	@EDAD INT,
	@PESO DECIMAL(4,2),
	@ESTADO INT,
	@POSICION NVARCHAR(50),
	@FECHAING DATETIME,
	@CAT_CODIGO INT,
	@CP_CODIGO INT )
AS 
	INSERT INTO Alumno 
		VALUES(@CODIGO,@NOMBRE,@APEPAT,@APEMAT,@SEXO,@FECHAING,@DIRECCION,@TELEFONO,
		@APODERADO,@EDAD,@PESO,@ESTADO,@POSICION,@FECHAING,@CAT_CODIGO,@CP_CODIGO)
GO

--Procedimiento almacenado que permite actualizar los datos del alumno

IF OBJECT_ID('ACTUALIZARALUMNO') IS NOT NULL
	DROP PROC ACTUALIZARALUMNO
GO

CREATE PROC ACTUALIZARALUMNO(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@APEPAT NVARCHAR(100),
	@APEMAT NVARCHAR(100),
	@SEXO NVARCHAR(50),
	@FECHANAC DATE,
	@DIRECCION NVARCHAR(100),
	@TELEFONO NVARCHAR(100),
	@APODERADO NVARCHAR(100),
	@EDAD INT,
	@PESO DECIMAL(4,2),
	@ESTADO INT,
	@POSICION NVARCHAR(50),
	@FECHAING DATETIME,
	@CAT_CODIGO INT,
	@CP_CODIGO INT )
AS 
	UPDATE Alumno 
	SET nombre=@NOMBRE,
		apellido_paterno = @APEPAT,
		apellido_materno=@APEMAT,
		sexo=@SEXO,
		fecha_nacimiento=@FECHANAC,
		direccion=@DIRECCION,
		telefono=@TELEFONO,
		apoderado=@APODERADO,
		edad=@EDAD,
		peso=@PESO,
		estado=@ESTADO,
		posicion=@POSICION,
		fecha_ingreso=@FECHAING,
		categoria_alumno_id=@CAT_CODIGO,
		condicion_pago_id=@CP_CODIGO
		WHERE id = @ID 
GO
--Procedimiento almacenado que permite eliminar un alumno según su código.

IF OBJECT_ID('EliminarAlumno') IS NOT NULL
	DROP PROC EliminarAlumno
GO

CREATE PROC EliminarAlumno(@CODIGO INT)
AS 
	DELETE Alumno	
			WHERE id = @CODIGO 
GO

--++++++++++++++++++++++++++++++++++++ BECA +++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permitirá mostrar un listado de las becas.

IF OBJECT_ID('ListadoBeca') IS NOT NULL
	DROP PROC ListadoBeca
GO

CREATE PROC ListadoBeca
AS
BEGIN
	SELECT BE.id  AS CODIGO,
			BE.nombre AS NOMBRE,
			BE.fecha_inicio AS 'FECHA INICIO',
			BE.fecha_fin AS 'FECHA FIN',
			PAT.nombre AS PATROCINADOR,
			AL.nombre  + ' '+ AL.apellido_paterno  AS ALUMNO
	FROM Beca BE
	JOIN Patrocinador PAT ON PAT.id  =BE.patrocinador_id 
	JOIN Alumno AL ON AL.id  = BE.alumno_id 
END
GO

--Procedimiento almacenado que permite mostrar el código de lA última beca
--registrada, esto es para obtener el nuevo código de la nueva beca

IF OBJECT_ID('ULTIMABECA') IS NOT NULL
	DROP PROC ULTIMABECA
GO

CREATE PROC ULTIMABECA
AS
	SELECT TOP 1 id 
			FROM Beca 
			ORDER BY id DESC
GO

--Procedimiento almacenado que permite insertar una nueva beca dentro de la base.

IF OBJECT_ID('NUEVABECA') IS NOT NULL
	DROP PROC NUEVABECA
GO

CREATE PROC NUEVABECA(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@FECHAINI DATETIME,
	@FECHAFIN DATETIME,
	@PAT_COD INT,
	@AL_COD INT)
AS 
	INSERT INTO Beca  
		VALUES(@ID,@NOMBRE,@FECHAINI,@FECHAFIN,@PAT_COD,@AL_COD)
GO

--Procedimiento almacenado que permite actualizar los datos de la beca

IF OBJECT_ID('ACTUALIZARBECA') IS NOT NULL
	DROP PROC ACTUALIZARBECA
GO

CREATE PROC ACTUALIZARBECA(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@FECHAINI DATETIME,
	@FECHAFIN DATETIME,
	@PAT_COD INT,
	@AL_COD INT)
AS 
	UPDATE Beca  
	SET nombre=@NOMBRE,
		fecha_inicio = @FECHAINI,
		fecha_fin=@FECHAFIN,
		patrocinador_id=@PAT_COD,
		alumno_id=@AL_COD 
		WHERE ID = @ID 
GO

--Procedimiento almacenado que permite eliminar una beca según su código.

IF OBJECT_ID('ELIMINABECA') IS NOT NULL
	DROP PROC ELIMINABECA
GO

CREATE PROC ELIMINABECA(@CODIGO INT)
AS 
	DELETE Beca 	
			WHERE ID = @CODIGO 
GO

--Procedimiento almacenado que permitirá mostrar un listado de las bitácoras.

IF OBJECT_ID('LISTADOBITACORA') IS NOT NULL
	DROP PROC LISTADOBITACORA
GO

CREATE PROC LISTADOBITACORA
AS
BEGIN
	SELECT BI.id  AS CODIGO,
			BI.fecha_hora AS 'FECHA/HORA',
			BI.registro  AS REGISTRO,
			BI.tabla AS TABLA,
			BI.usuario_id AS USUARIO
			FROM BITACORA BI		
END
GO

--Procedimiento almacenado que permite mostrar el código de la última bitacora
--registrada, esto es para obtener el nuevo código de la nueva bitacora

IF OBJECT_ID('ULTIMABITACORA') IS NOT NULL
	DROP PROC ULTIMABITACORA
GO

CREATE PROC ULTIMABITACORA
AS
	SELECT TOP 1 ID 
			FROM Bitacora 
			ORDER BY ID  DESC
GO


--Procedimiento almacenado que permite insertar un nuevo alumno dentro de la base.

IF OBJECT_ID('NUEVABITACORA') IS NOT NULL
	DROP PROC NUEVABITACORA
GO

CREATE PROC NUEVABITACORA(
	@ID INT,
	@FECHAHORA DATETIME,
	@TABLA NVARCHAR(50),
	@REGISTRO NVARCHAR(250),
	@USU_CODIGO INT)
AS 
	INSERT INTO bitacora 
		VALUES(@ID,@FECHAHORA,@TABLA,@REGISTRO,@USU_CODIGO)
GO

--Procedimiento almacenado que permite actualizar los datos de la bitacora

IF OBJECT_ID('ACTUALIZARBITACORA') IS NOT NULL
	DROP PROC ACTUALIZARBITACORA
GO

CREATE PROC ACTUALIZARBITACORA(
	@CODIGO INT,
	@FECHAHORA DATETIME,
	@TABLA NVARCHAR(50),
	@REGISTRO NVARCHAR(250),
	@USU_CODIGO INT)
AS 
	UPDATE BITACORA 
	SET fecha_hora = @FECHAHORA,
		tabla = @TABLA ,
		registro = @REGISTRO ,
		usuario_id = @USU_CODIGO 
		WHERE ID = @CODIGO 
GO
--Procedimiento almacenado que permite eliminar una bitacora según su código.

IF OBJECT_ID('ELIMINARBITACORA') IS NOT NULL
	DROP PROC ELIMINARBITACORA
GO

CREATE PROC ELIMINARBITACORA(@CODIGO INT)
AS 
	DELETE Bitacora 	
			WHERE ID = @CODIGO 
GO


--Procedimiento almacenado que permite mostrar las categorias de alumno tahuichi esto nos servirá para 
--mostrar las categorias en los cuadros combinados del nuevo alumno y su actualización

IF OBJECT_ID('LISTACATEGORIAALUMNO') IS NOT NULL
	DROP PROC LISTACATEGORIAALUMNO
GO

CREATE PROC LISTACATEGORIAALUMNO
AS
	SELECT *
			FROM categoria_alumno 
			ORDER BY edad 
GO

--Procedimiento almacenado que permite mostrar el código de la última categoria de alumnos
--registrada, esto es para obtener el nuevo código de la nueva categoria alumno

IF OBJECT_ID('ULTIMACATEGORIAALUMNO') IS NOT NULL
	DROP PROC ULTIMACATEGORIAALUMNO
GO

CREATE PROC ULTIMACATEGORIAALUMNO
AS
	SELECT TOP 1 ID 
			FROM categoria_alumno  
			ORDER BY ID DESC
GO


--Procedimiento almacenado que permite insertar una nueva Categoria dentro de la base de datos.

IF OBJECT_ID('NUEVACATEGORIAALUMNO') IS NOT NULL
	DROP PROC NUEVACATEGORIAALUMNO
GO

CREATE PROC NUEVACATEGORIAALUMNO(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@EDAD INT )
AS 
	INSERT INTO categoria_alumno  
		VALUES(@ID,@NOMBRE,@EDAD)
GO

--Procedimiento almacenado que permite actualizar los datos de la categoria alumnos

IF OBJECT_ID('ACTUALIZARCATEGORIAALUMNOS') IS NOT NULL
	DROP PROC ACTUALIZARCATEGORIAALUMNOS
GO

CREATE PROC ACTUALIZARCATEGORIAALUMNOS(
	@CODIGO INT,
	@NOMBRE NVARCHAR(100),
	@EDAD INT )
AS 
	UPDATE categoria_alumno  
	SET nombre  = @NOMBRE,
		edad  = @EDAD    
		WHERE ID = @CODIGO 
GO

--Procedimiento almacenado que permite eliminar una categoria de alumno según su código.

IF OBJECT_ID('ELIMINARCATEGORIAALUMNO') IS NOT NULL
	DROP PROC ELIMINARCATEGORIAALUMNO
GO

CREATE PROC ELIMINARCATEGORIAALUMNO(@CODIGO INT)
AS 
	DELETE categoria_alumno 	
			WHERE ID = @CODIGO 
GO

--++++++++++++++++++++++++++++++++++++ CATEGORIATECNICO +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar las categorias de Tecnicos, esto nos servirá para 
--mostrar las categorias en los cuadros combinados del nuevo alumno y su actualización

IF OBJECT_ID('LISTACATEGORIATECNICO') IS NOT NULL
	DROP PROC LISTACATEGORIATECNICO
GO

CREATE PROC LISTACATEGORIATECNICO
AS
	SELECT *
			FROM categoria_tecnico  
			ORDER BY nombre  
GO

--Procedimiento almacenado que permite mostrar el código de la última categoria de tecnicos
--registrado, esto es para obtener el nuevo código del nuevo tecnico

IF OBJECT_ID('ULTIMACATEGORIATECNICO') IS NOT NULL
	DROP PROC ULTIMACATEGORIATECNICO
GO

CREATE PROC ULTIMACATEGORIATECNICO
AS
	SELECT TOP 1 ID 
			FROM categoria_tecnico   
			ORDER BY ID DESC
GO

--Procedimiento almacenado que permite insertar un nuevo Categoria tecnico dentro de la base de datos.

IF OBJECT_ID('NUEVACATEGORIATECNICO') IS NOT NULL
	DROP PROC NUEVACATEGORIATECNICO
GO

CREATE PROC NUEVACATEGORIATECNICO(
	@ID INT,
	@NOMBRE NVARCHAR(100) )
AS 
	INSERT INTO categoria_tecnico   
		VALUES(@ID,@NOMBRE)
GO

--Procedimiento almacenado que permite actualizar los datos de la categoria alumnos

IF OBJECT_ID('ActualizarCategoriaTecnico') IS NOT NULL
	DROP PROC ActualizarCategoriaTecnico
GO

CREATE PROC ActualizarCategoriaTecnico(
	@ID INT,
	@NOMBRE NVARCHAR(100) )
AS 
	UPDATE categoria_tecnico   
	SET nombre   = @NOMBRE     
		WHERE ID = @ID 
GO

--Procedimiento almacenado que permite eliminar una categoria de tecnico según su código.

IF OBJECT_ID('ELIMINARCATEGORIATECNICO') IS NOT NULL
	DROP PROC ELIMINARCATEGORIATECNICO
GO

CREATE PROC ELIMINARCATEGORIATECNICO(@CODIGO INT)
AS 
	DELETE categoria_tecnico 	
			WHERE ID = @CODIGO 
GO

--++++++++++++++++++++++++++++++++++++ CONDICIONPAGO +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar las condiciones de pago esto nos servirá para 
--mostrar las condiciones de pago en los cuadros combinados del nuevo alumno y su actualización

IF OBJECT_ID('LISTACONDICIONPAGO') IS NOT NULL
	DROP PROC LISTACONDICIONPAGO
GO

CREATE PROC LISTACONDICIONPAGO
AS
	SELECT *
			FROM Condicion_Pago  
			ORDER BY nombre  
GO


--Procedimiento almacenado que permite mostrar el código de la última condicion de pago
--registrada, esto es para obtener el nuevo código de la nueva condicion de pago

IF OBJECT_ID('ULTIMACONDICIONPAGO') IS NOT NULL
	DROP PROC ULTIMACONDICIONPAGO
GO

CREATE PROC ULTIMACONDICIONPAGO
AS
	SELECT TOP 1 ID  
			FROM condicion_pago    
			ORDER BY ID DESC
GO

--Procedimiento almacenado que permite insertar una nueva condicion de pago dentro de la base de datos.

IF OBJECT_ID('NUEVACONDICIONPAGO') IS NOT NULL
	DROP PROC NUEVACONDICIONPAGO
GO

CREATE PROC NUEVACONDICIONPAGO(
	@ID INT,
	@NOMBRE NVARCHAR(100) )
AS 
	INSERT INTO condicion_pago   
		VALUES(@ID,@NOMBRE)
GO

--Procedimiento almacenado que permite actualizar los datos de la condicion de pago

IF OBJECT_ID('ACTUALIZARCONDICIONPAGO') IS NOT NULL
	DROP PROC ACTUALIZARCONDICIONPAGO
GO

CREATE PROC ACTUALIZARCONDICIONPAGO(
	@ID INT,
	@NOMBRE NVARCHAR(100) )
AS 
	UPDATE Condicion_Pago    
	SET nombre = @NOMBRE     
		WHERE ID = @ID 
GO

--Procedimiento almacenado que permite eliminar una condicion de pago según su código.

IF OBJECT_ID('ELIMINARCONDICIONPAGO') IS NOT NULL
	DROP PROC ELIMINARCONDICIONPAGO
GO

CREATE PROC ELIMINARCONDICIONPAGO(@CODIGO INT)
AS 
	DELETE condicion_pago  	
			WHERE ID = @CODIGO 
GO
--++++++++++++++++++++++++++++++++++++ CURSOTEMPORADA +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar los cursotemporada

IF OBJECT_ID('LISTACURSOTEMPORADA') IS NOT NULL
	DROP PROC LISTACURSOTEMPORADA
GO

CREATE PROC LISTACURSOTEMPORADA
AS
	SELECT *
			FROM curso_temporada   
			ORDER BY ID   
GO


--Procedimiento almacenado que permite mostrar el código del ultimo cursotemporada
--registrada, esto es para obtener el nuevo código del nuevo cursotemporada

IF OBJECT_ID('ULTIMOCURSOTEMPORADA') IS NOT NULL
	DROP PROC ULTIMOCURSOTEMPORADA
GO

CREATE PROC ULTIMOCURSOTEMPORADA
AS
	SELECT TOP 1   ID 
			FROM curso_temporada     
			ORDER BY ID  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo cursotemporada dentro de la base de datos.

IF OBJECT_ID('NUEVOCURSOTEMPORADA') IS NOT NULL
	DROP PROC NUEVOCURSOTEMPORADA
GO

CREATE PROC NUEVOCURSOTEMPORADA(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@LUGAR_E_ID INT,
	@HORARIO_ID INT,
	@TECNICO_ID INT )
AS 
	INSERT INTO Curso_Temporada    
		VALUES(@ID,@NOMBRE,@LUGAR_E_ID,@HORARIO_ID,@TECNICO_ID)
GO

--Procedimiento almacenado que permite actualizar los datos de la condicion de pago

IF OBJECT_ID('ACTUALIZARCURSOTEMPORADA') IS NOT NULL
	DROP PROC ACTUALIZARCURSOTEMPORADA
GO

CREATE PROC ACTUALIZARCURSOTEMPORADA(
	@ID INT,
	@NOMBRE NVARCHAR(100),
	@LUGAR_E_ID INT,
	@HORARIO_ID INT,
	@TECNICO_ID INT )
AS 
	UPDATE curso_temporada     
	SET nombre	= @NOMBRE,
		lugar_entrenamiento_id= @LUGAR_E_ID,
		horario_id	= @HORARIO_ID,
		tecnico_id	= @TECNICO_ID 
		WHERE ID = @ID 
GO

--Procedimiento almacenado que permite eliminar un curso temporada según su código.

IF OBJECT_ID('ELIMINARCURSOTEMPORADA') IS NOT NULL
	DROP PROC ELIMINARCURSOTEMPORADA
GO

CREATE PROC ELIMINARCURSOTEMPORADA(@CODIGO INT)
AS 
	DELETE Curso_Temporada   	
			WHERE ID = @CODIGO
GO
--++++++++++++++++++++++++++++++++++++ CURSOTEMPORADAMESREL +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite insertar un nuevo curso mes de la base de datos.

IF OBJECT_ID('NuevoCursoTemporadaMes') IS NOT NULL
	DROP PROC NuevoCursoTemporadaMes
GO

CREATE PROC NuevoCursoTemporadaMes(
	@curso_temporada_id INT,
	@MES_ID INT )
AS 
	INSERT INTO curso_temporada_mes_rel   
		VALUES(@curso_temporada_id,@MES_ID)
GO

--Procedimiento almacenado que permite actualizar los datos de CURSOMES

IF OBJECT_ID('ActualizarCursoTemporadaMes') IS NOT NULL
	DROP PROC ActualizarCursoTemporadaMes
GO

CREATE PROC ActualizarCursoTemporadaMes(
	@curso_temporada_id INT,
	@mes_id INT )
AS 
	UPDATE curso_temporada_mes_rel     
	SET curso_temporada_id	= @curso_temporada_id,
		mes_id		= @mes_id    
		WHERE curso_temporada_id = @curso_temporada_id AND  mes_id = @mes_id 
GO

--Procedimiento almacenado que permite eliminar un CURSOMES según su código.

IF OBJECT_ID('EliminarCursoTemporadaMes') IS NOT NULL
	DROP PROC EliminarCursoTemporadaMes
GO

CREATE PROC EliminarCursoTemporadaMes(@curso_temporada_id INT,@mes_id INT )
AS 
	DELETE curso_temporada_mes_rel  	
			WHERE curso_temporada_id = @curso_temporada_id AND  mes_id = @mes_id 
GO


--++++++++++++++++++++++++++++++++++++ DETALLEPAGO +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar el detalle de pago

IF OBJECT_ID('ListaDetallePago') IS NOT NULL
	DROP PROC ListaDetallePago
GO

CREATE PROC ListaDetallePago(@pago_id INT)
AS
	SELECT *
			FROM Detalle_Pago   
			WHERE pago_id= @pago_id 
GO


--Procedimiento almacenado que permite insertar un nuevo detallepago dentro de la base de datos.

IF OBJECT_ID('NuevoDetallPago') IS NOT NULL
	DROP PROC NuevoDetallPago
GO

CREATE PROC NuevoDetallPago(
	@id int,
	@mes_id INT,
	@pago_id INT,
	@precio MONEY,
	@cantidad INT,
	@precio_total MONEY )
AS 
	INSERT INTO Detalle_Pago     
		VALUES(@id,@mes_id,@pago_id,@precio,@cantidad,@precio_total)
GO

--Procedimiento almacenado que permite actualizar los datos de DETALLEPAGO

IF OBJECT_ID('ActualizarDetallePago') IS NOT NULL
	DROP PROC ActualizarDetallePago
GO

CREATE PROC ActualizarDetallePago(
	@id int,
	@mes_id INT,
	@pago_id INT,
	@precio MONEY,
	@cantidad INT,
	@precio_total MONEY)
AS 
	UPDATE detalle_pago      
	SET mes_id  	= @mes_id,
		pago_id 	= @pago_id,
		precio	= @precio,
		cantidad = @cantidad,
		precio_total = @precio_total
		
		WHERE pago_id = @pago_id
GO

--Procedimiento almacenado que permite eliminar un DETALLEPAGO según su código.

IF OBJECT_ID('EliminarDetallePago') IS NOT NULL
	DROP PROC EliminarDetallePago
GO

CREATE PROC EliminarDetallePago(@pago_id INT)
AS 
	DELETE Detalle_Pago    	
			WHERE pago_id = @pago_id
GO

--++++++++++++++++++++++++++++++++++++ HORARIO +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar el HORARIO

IF OBJECT_ID('ListaHorario') IS NOT NULL
	DROP PROC ListaHorario
GO

CREATE PROC ListaHorario 
AS
	SELECT *
			FROM Horario    
			ORDER BY dias  
GO

--Procedimiento almacenado que permite mostrar el código del último HORARIO
--registrado esto es para obtener el nuevo código del nuevo HORARIO

IF OBJECT_ID('UltimoHorario') IS NOT NULL
	DROP PROC UltimoHorario
GO

CREATE PROC UltimoHorario
AS
	SELECT TOP 1 id 
			FROM Horario 
			ORDER BY id DESC
GO

--Procedimiento almacenado que permite insertar un nuevo HORARIO dentro de la base de datos.

IF OBJECT_ID('NuevoHorario') IS NOT NULL
	DROP PROC NuevoHorario
GO

CREATE PROC NuevoHorario(
	@id INT,
	@dias INT )
AS 
	INSERT INTO Horario      
		VALUES(@id,@dias)
GO

--Procedimiento almacenado que permite actualizar los datos de HORARIO

IF OBJECT_ID('ActualizarHorario') IS NOT NULL
	DROP PROC ActualizarHorario
GO

CREATE PROC ActualizarHorario(
	@id INT,
	@dias INT )
AS 
	UPDATE Horario       
	SET dias = @dias  
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un HORARIO según su código.

IF OBJECT_ID('EliminarHorario') IS NOT NULL
	DROP PROC EliminarHorario
GO

CREATE PROC EliminarHorario(@id INT )
AS 
	DELETE Horario     	
			WHERE id  = @id
GO

--++++++++++++++++++++++++++++++++++++ LUGAR DE ENTRENAMIENTO +++++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permite mostrar el LUGAR DE ENTRENAMIENTO

IF OBJECT_ID('ListaLugarEntrenamiento') IS NOT NULL
	DROP PROC ListaLugarEntrenamiento
GO

CREATE PROC ListaLugarEntrenamiento 
AS
	SELECT *
			FROM lugar_entrenamiento     
			ORDER BY nombre   
GO

--Procedimiento almacenado que permite mostrar el código del último LUGAR DE ENTRENAMIENTO
--registrado esto es para obtener el nuevo código del nuevo LUGAR DE ENTRENAMIENTO

IF OBJECT_ID('UltimoLugarEntrenamiento') IS NOT NULL
	DROP PROC UltimoLugarEntrenamiento
GO

CREATE PROC UltimoLugarEntrenamiento
AS
	SELECT TOP 1 id 
			FROM lugar_entrenamiento  
			ORDER BY id  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo LUGAR DE ENTRENAMIENTO dentro de la base de datos.

IF OBJECT_ID('NuevoLugarEntrenamiento') IS NOT NULL
	DROP PROC NuevoLugarEntrenamiento
GO

CREATE PROC NuevoLugarEntrenamiento(
	@id INT,
	@nombre INT )
AS 
	INSERT INTO Lugar_Entrenamiento       
		VALUES(@id,@nombre )
GO

--Procedimiento almacenado que permite actualizar los datos de LUGAR DE ENTRENAMIENTO

IF OBJECT_ID('ActualizarLugarEntrenamiento') IS NOT NULL
	DROP PROC ActualizarLugarEntrenamiento
GO

CREATE PROC ActualizarLugarEntrenamiento(
	@id INT,
	@nombre INT )
AS 
	UPDATE Lugar_Entrenamiento        
	SET nombre = @nombre   
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un LUGAR DE ENTRENAMIENTO según su código.

IF OBJECT_ID('EliminarLugarEntrenamiento') IS NOT NULL
	DROP PROC EliminarLugarEntrenamiento
GO

CREATE PROC EliminarLugarEntrenamiento(@id INT )
AS 
	DELETE lugar_entrenamiento      	
			WHERE id = @id
GO

--++++++++++++++++++++++++++++++++++++ MES CURSO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los meses de los cursos durante el año.

--Procedimiento almacenado que permite mostrar los meses del los cursos

IF OBJECT_ID('ListaMesDelCurso') IS NOT NULL
	DROP PROC ListaMesDelCurso
GO

CREATE PROC ListaMesDelCurso 
AS
	SELECT *
			FROM mes_del_curso      
			ORDER BY id    
GO

--Procedimiento almacenado que permite mostrar el código del último MES DE LOS CURSOS
--registrado esto es para obtener el nuevo código del nuevo MES DEL CURSO

IF OBJECT_ID('UltimoMesDelCurso') IS NOT NULL
	DROP PROC UltimoMesDelCurso
GO

CREATE PROC UltimoMesDelCurso
AS
	SELECT TOP 1 id  
			FROM mes_del_curso   
			ORDER BY id  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo MES DE CURSO dentro de la base de datos.

IF OBJECT_ID('NuevoMesDelCurso') IS NOT NULL
	DROP PROC NuevoMesDelCurso
GO

CREATE PROC NuevoMesDelCurso(
	@id INT,
	@nombre INT )
AS 
	INSERT INTO mes_del_curso        
		VALUES(@id,@nombre )
GO

--Procedimiento almacenado que permite actualizar los datos de MESCURSO

IF OBJECT_ID('ActualizarMesDelCurso') IS NOT NULL
	DROP PROC ActualizarMesDelCurso
GO

CREATE PROC ActualizarMesDelCurso(
	@id INT,
	@nombre INT )
AS 
	UPDATE mes_del_curso         
	SET nombre  = @nombre   
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un MESCURSO según su código.

IF OBJECT_ID('EliminarMesDelCurso') IS NOT NULL
	DROP PROC EliminarMesDelCurso
GO

CREATE PROC EliminarMesDelCurso(@id INT )
AS 
	DELETE mes_del_curso       	
			WHERE id = @id
GO

--++++++++++++++++++++++++++++++++++++ PAGO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los meses de los cursos durante el año.

--Procedimiento almacenado que permite mostrar los PAGOS

IF OBJECT_ID('ListaPago') IS NOT NULL
	DROP PROC ListaPago
GO

CREATE PROC ListaPago 
AS
	SELECT *
			FROM Pago       
			ORDER BY id     
GO

--Procedimiento almacenado que permite mostrar el código del último PAGO
--registrado esto es para obtener el nuevo código del nuevo PAGO

IF OBJECT_ID('UltimoPago') IS NOT NULL
	DROP PROC UltimoPago
GO

CREATE PROC UltimoPago
AS
	SELECT TOP 1 id  
			FROM pago   
			ORDER BY id  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo PAGO dentro de la base de datos.
--- 
IF OBJECT_ID('NuevoPago') IS NOT NULL
	DROP PROC NuevoPago
GO

CREATE PROC NuevoPago(
	@id INT,
	@fecha DATETIME,
	@descuento MONEY,
	@monto MONEY,
	@glosa NVARCHAR(250),
	@usuario_id INT)
AS 
	INSERT INTO Pago         
		VALUES(@id,@fecha,@descuento,@monto,@glosa,@usuario_id)
GO

--Procedimiento almacenado que permite actualizar los datos de PAGO

IF OBJECT_ID('ActualizarPago') IS NOT NULL
	DROP PROC ActualizarPago
GO

CREATE PROC ActualizarPago(
	@id INT,
	@fecha DATETIME,
	@descuento MONEY,
	@monto MONEY,
	@glosa NVARCHAR(250),
	@usuario_id INT)
AS 
	UPDATE Pago          
	SET fecha = @fecha,
		descuento = @descuento,
		monto = @monto,
		glosa = @glosa,
		usuario_id = @usuario_id
		 
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un PAGO según su código.

IF OBJECT_ID('EliminarPago') IS NOT NULL
	DROP PROC EliminarPago
GO

CREATE PROC EliminarPago(@id INT )
AS 
	DELETE Pago        	
			WHERE id = @id
GO


--++++++++++++++++++++++++++++++++++++ PATROCINADOR +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los PATROCINADORES

--Procedimiento almacenado que permite mostrar los PATROCINADORES

IF OBJECT_ID('ListaPatrocinador') IS NOT NULL
	DROP PROC ListaPatrocinador
GO

CREATE PROC ListaPatrocinador 
AS
	SELECT *
			FROM Patrocinador        
			ORDER BY nombre      
GO

--Procedimiento almacenado que permite mostrar el código del último PATROCINADOR
--registrado esto es para obtener el nuevo código del nuevo PATROCINADOR

IF OBJECT_ID('UltimoPatrocinador') IS NOT NULL
	DROP PROC UltimoPatrocinador
GO

CREATE PROC UltimoPatrocinador
AS
	SELECT TOP 1 id   
			FROM Patrocinador    
			ORDER BY id DESC
GO

--Procedimiento almacenado que permite insertar un nuevo PATROCINADOR dentro de la base de datos.

IF OBJECT_ID('NuevoPatrocinador') IS NOT NULL
	DROP PROC NuevoPatrocinador
GO

CREATE PROC NuevoPatrocinador(
	@id INT,
	@nombre NVARCHAR(100))
AS 
	INSERT INTO patrocinador         
		VALUES(@id,@nombre )
GO

--Procedimiento almacenado que permite actualizar los datos del PATROCINADOR

IF OBJECT_ID('ActualizarPatrocinador') IS NOT NULL
	DROP PROC ActualizarPatrocinador
GO

CREATE PROC ActualizarPatrocinador(
	@id INT,
	@nombre NVARCHAR(100))
AS 
	UPDATE Patrocinador           
	SET nombre = @nombre  
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un PATROCINADOR según su código.

IF OBJECT_ID('EliminarPatrocinador') IS NOT NULL
	DROP PROC EliminarPatrocinador
GO

CREATE PROC EliminarPatrocinador(@id INT )
AS 
	DELETE PATROCINADOR        	
			WHERE id = @id
GO

--++++++++++++++++++++++++++++++++++++ PRIVILEGIO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los PRIVILEGIO

--Procedimiento almacenado que permite mostrar los PRIVILEGIO

IF OBJECT_ID('ListaPrivilegio') IS NOT NULL
	DROP PROC ListaPrivilegio
GO

CREATE PROC ListaPrivilegio 
AS
	SELECT *
			FROM Privilegio         
			ORDER BY id       
GO

--Procedimiento almacenado que permite mostrar el código del último PRIVILEGIO
--registrado esto es para obtener el nuevo código del nuevo PRIVILEGIO

IF OBJECT_ID('UltimoPrivilegio') IS NOT NULL
	DROP PROC UltimoPrivilegio
GO

CREATE PROC UltimoPrivilegio
AS
	SELECT TOP 1 id    
			FROM privilegio    
			ORDER BY id  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo PRIVILEGIO dentro de la base de datos.

IF OBJECT_ID('NuevoPrivilegio') IS NOT NULL
	DROP PROC NuevoPrivilegio
GO

CREATE PROC NuevoPrivilegio(
	@id INT,
	@nombre NVARCHAR(50))
AS 
	INSERT INTO privilegio         
		VALUES(@id,@nombre)
GO

--Procedimiento almacenado que permite actualizar los datos del PRIVILEGIO

IF OBJECT_ID('ActualizarPrivilegio') IS NOT NULL
	DROP PROC ActualizarPrivilegio
GO

CREATE PROC ActualizarPrivilegio(
	@id INT,
	@nombre NVARCHAR(50))
AS 
	UPDATE privilegio           
	SET nombre = @nombre 
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un PRIVILEGIO según su código.

IF OBJECT_ID('EliminarPrivilegio') IS NOT NULL
	DROP PROC EliminarPrivilegio
GO

CREATE PROC EliminarPrivilegio(@id INT )
AS 
	DELETE privilegio        	
			WHERE id = @id
GO

--++++++++++++++++++++++++++++++++++++ TECNICO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los TECNICOS

--Procedimiento almacenado que permite mostrar los TECNICOS

IF OBJECT_ID('ListaTecnico') IS NOT NULL
	DROP PROC ListaTecnico
GO

CREATE PROC ListaTecnico 
AS
	SELECT *
			FROM Tecnico          
			ORDER BY nombre        
GO

--Procedimiento almacenado que permite mostrar el código del último TECNICO
--registrado esto es para obtener el nuevo código del nuevo TECNICO

IF OBJECT_ID('UltimoTecnico') IS NOT NULL
	DROP PROC UltimoTecnico
GO

CREATE PROC UltimoTecnico
AS
	SELECT TOP 1 id    
			FROM Tecnico     
			ORDER BY id   DESC
GO

--Procedimiento almacenado que permite insertar un nuevo TECNICO dentro de la base de datos.

IF OBJECT_ID('NuevoTecnico') IS NOT NULL
	DROP PROC NuevoTecnico
GO

CREATE PROC NuevoTecnico(
	@CODIGO INT,
	@CI NVARCHAR(50),
	@NOMBRE NVARCHAR(100),
	@APEPAT NVARCHAR(100),
	@APEMAT NVARCHAR(100),
	@FECHANAC DATETIME,
	@SEXO NVARCHAR(50),
	@TEL NVARCHAR(50),
	@DIREC NVARCHAR(100),
	@FECHAING DATETIME,
	@ESTADO INT,
	@CATTEC_CODIGO INT
	)
AS 
	INSERT INTO Tecnico        
		VALUES(@CODIGO,@CI,@NOMBRE,@APEPAT,@APEMAT,@FECHANAC,
				@SEXO,@TEL,@DIREC,@FECHAING,@ESTADO,@CATTEC_CODIGO)
GO

--Procedimiento almacenado que permite actualizar los datos del TECNICO

IF OBJECT_ID('ActualizarTecnico') IS NOT NULL
	DROP PROC ActualizarTecnico
GO

CREATE PROC ActualizarTecnico(
	@CODIGO INT,
	@CI NVARCHAR(50),
	@NOMBRE NVARCHAR(100),
	@APEPAT NVARCHAR(100),
	@APEMAT NVARCHAR(100),
	@FECHANAC DATETIME,
	@SEXO NVARCHAR(50),
	@TEL NVARCHAR(50),
	@DIREC NVARCHAR(100),
	@FECHAING DATETIME,
	@ESTADO INT,
	@CATTEC_CODIGO INT
	)
AS 
	UPDATE Tecnico 
	SET carnet_identidad  = @CI,
		nombre = @NOMBRE ,
		apellido_paterno = @APEPAT ,
		apellido_materno = @APEMAT ,
		fecha_nacimiento =@FECHANAC ,
		sexo = @SEXO ,
		telefono =@TEL ,
		direccion = @DIREC ,
		fecha_ingreso = @FECHAING ,
		estado = @ESTADO,
		categoria_tecnico_id =@CATTEC_CODIGO 
		WHERE id = @CODIGO 
GO

--Procedimiento almacenado que permite eliminar un TECNICO según su código.

IF OBJECT_ID('EliminarTecnico') IS NOT NULL
	DROP PROC EliminarTecnico
GO

CREATE PROC EliminarTecnico(@id INT )
AS 
	DELETE TECNICO
			WHERE id = @id
GO

--++++++++++++++++++++++++++++++++++++ TIPOUSUARIO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los TIPOUSUARIOS

--Procedimiento almacenado que permite mostrar los TIPOS DE USUARIO

IF OBJECT_ID('ListaTipoUsuario') IS NOT NULL
	DROP PROC ListaTipoUsuario
GO

CREATE PROC ListaTipoUsuario 
AS
	SELECT *
			FROM tipo_usuario           
			ORDER BY id         
GO

--Procedimiento almacenado que permite mostrar el código del último TIPOUSUARIO
--registrado esto es para obtener el nuevo código del nuevo TIPOUSUARIO

IF OBJECT_ID('UltimoTipoUsuario') IS NOT NULL
	DROP PROC UltimoTipoUsuario
GO

CREATE PROC UltimoTipoUsuario
AS
	SELECT TOP 1 id     
			FROM tipo_usuario     
			ORDER BY id  DESC
GO

--Procedimiento almacenado que permite insertar un nuevo TIPOUSUARIO dentro de la base de datos.

IF OBJECT_ID('NuevoTipoUsuario') IS NOT NULL
	DROP PROC NuevoTipoUsuario
GO

CREATE PROC NuevoTipoUsuario(
	@id INT,
	@nombre NVARCHAR(50)
	)
AS 
	INSERT INTO tipo_usuario        
		VALUES(@id,@nombre)
GO

--Procedimiento almacenado que permite actualizar los datos del TIPOUSUARIO

IF OBJECT_ID('ActualizarTipoUsuario') IS NOT NULL
	DROP PROC ActualizarTipoUsuario
GO

CREATE PROC ActualizarTipoUsuario (
	@id INT,
	@nombre NVARCHAR(50)
	)
AS 
	UPDATE tipo_usuario 
	SET nombre = @nombre 
		WHERE id = @id 
GO

--Procedimiento almacenado que permite eliminar un TIPOUSUARIO según su código.

IF OBJECT_ID('EliminarTipoUsuario') IS NOT NULL
	DROP PROC EliminarTipoUsuario
GO

CREATE PROC EliminarTipoUsuario(@CODIGO INT )
AS 
	DELETE tipo_usuario
			WHERE id = @CODIGO
GO


--++++++++++++++++++++++++++++++++++++ TIPOUSUARIO_PRIVILEGIO +++++++++++++++++++++++++++++++++++
--Seccion para el manejo de los TIPOUSUARIOS PRIVILEGIO

--Procedimiento almacenado que permite insertar un nuevo TIPOUSUARIO PRIVILEGIO dentro de la base de datos.

IF OBJECT_ID('NuevotipoUsuarioPrivilegio') IS NOT NULL
	DROP PROC NuevotipoUsuarioPrivilegio
GO

CREATE PROC NuevotipoUsuarioPrivilegio(
	@tipo_usuario_id INT,
	@privilegio_id INT
	)
AS 
	INSERT INTO tipo_usuario_privilegio       
		VALUES(@tipo_usuario_id,@privilegio_id )
GO

--Procedimiento almacenado que permite actualizar los datos del TIPOUSUARIO

IF OBJECT_ID('ActualizarTipoUsuarioPrivilegio') IS NOT NULL
	DROP PROC ActualizarTipoUsuarioPrivilegio
GO

CREATE PROC ActualizarTipoUsuarioPrivilegio (
	@tipo_usuario_id INT,
	@privilegio_id INT
	)
AS 
	UPDATE tipo_usuario_privilegio  
	SET tipo_usuario_Id   = @tipo_usuario_id ,
		privilegio_Id		= @privilegio_id  
		WHERE tipo_usuario_Id = @tipo_usuario_id and privilegio_Id = @privilegio_id  
GO

--Procedimiento almacenado que permite eliminar un TIPOUSUARIO PRIVILEGIO según su código.

IF OBJECT_ID('EliminarTipoUsuarioPrivilegio') IS NOT NULL
	DROP PROC EliminarTipoUsuarioPrivilegio
GO

CREATE PROC EliminarTipoUsuarioPrivilegio(
	@tipo_usuario_id INT,
	@privilegio_id INT
	)
AS 
	DELETE tipo_usuario_privilegio 
			WHERE tipo_usuario_Id = @tipo_usuario_id and privilegio_Id = @privilegio_id  
GO

--++++++++++++++++++++++++++++++++++++ USUARIO +++++++++++++++++++++++++++++++++
--Procedimiento almacenado que permitirá mostrar un listado de los USUARIOS.

IF OBJECT_ID('ListaUsuario') IS NOT NULL
	DROP PROC ListaUsuario
GO

CREATE PROC ListaUsuario
AS
BEGIN
	SELECT *
			FROM usuario
END
GO

--Procedimiento almacenado que permite mostrar el código del último USUARIO
--registrado esto es para obtener el nuevo código del nuevo USUARIO

IF OBJECT_ID('UltimoUsuario') IS NOT NULL
	DROP PROC UltimoUsuario
GO

CREATE PROC UltimoUsuario
AS
	SELECT TOP 1 id 
			FROM Usuario 
			ORDER BY id  DESC
GO


--Procedimiento almacenado que permite insertar un nuevo USUARIO dentro de la base.

IF OBJECT_ID('NuevoUsuario') IS NOT NULL
	DROP PROC NuevoUsuario
GO

CREATE PROC NuevoUsuario(
	@CODIGO INT,
	@LOGIN NVARCHAR(50),
	@PASS NVARCHAR(100),
	@NOMBRE NVARCHAR(100),
	@DIRECC NVARCHAR(250),
	@TELF NVARCHAR(50),
	@FECHAREG DATETIME,
	@ESTADO INT,
	@TIPOUSU_CODIGO INT )
AS 
	INSERT INTO Usuario  
		VALUES(@CODIGO,@LOGIN,@PASS,@NOMBRE,@DIRECC,@TELF,@FECHAREG,@ESTADO,@TIPOUSU_CODIGO)
GO

--Procedimiento almacenado que permite actualizar los datos del USUARIO

IF OBJECT_ID('ActualizarUsuario') IS NOT NULL
	DROP PROC ActualizarUsuario
GO

CREATE PROC ActualizarUsuario(
	@CODIGO INT,
	@LOGIN NVARCHAR(50),
	@PASS NVARCHAR(100),
	@NOMBRE NVARCHAR(100),
	@DIRECC NVARCHAR(250),
	@TELF NVARCHAR(50),
	@FECHAREG DATETIME,
	@ESTADO INT,
	@TIPOUSU_CODIGO INT )
AS 
	UPDATE USUARIO 
	SET login = @LOGIN ,
		password = @PASS ,
		nombre = @NOMBRE ,
		direccion = @DIRECC ,
		telefono = @TELF ,
		fecha_registro = @FECHAREG ,
		estado = @ESTADO ,
		tipo_usuario_id = @TIPOUSU_CODIGO 
		
		WHERE id = @CODIGO 
GO
--Procedimiento almacenado que permite eliminar un USUARIO según su código.

IF OBJECT_ID('EliminarUsuario') IS NOT NULL
	DROP PROC EliminarUsuario
GO

CREATE PROC EliminarUsuario(@id INT)
AS 
	DELETE USUARIO	
			WHERE id = @id 
GO