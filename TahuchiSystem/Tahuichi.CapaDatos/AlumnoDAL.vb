Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class AlumnoDAL

    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarAlumno() As List(Of AlumnoEntity)
        Dim list As New List(Of AlumnoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTAALUMNO")
            While reader.Read
                list.Add(CargarAlumno(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoAlumno() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMOALUMNO"))
        Return codigo
    End Function



    Public Function Guardar(ByVal alumno As AlumnoEntity) As AlumnoEntity
        alumno.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVOALUMNO", alumno))
        Return alumno
    End Function

    Public Function Actualizar(ByVal alumno As AlumnoEntity) As AlumnoEntity
        alumno.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARALUMNO", alumno))
        Return alumno
    End Function

    Public Sub Eliminar(ByVal alumno As AlumnoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARALUMNO", alumno.id)
    End Sub

    Private Function CargarAlumno(reader As IDataReader) As AlumnoEntity
        Dim alumno As New AlumnoEntity
        alumno.id = Convert.ToInt32(reader("id"))
        alumno.nombre = Convert.ToString(reader("nombre"))
        alumno.apellido_paterno = Convert.ToString(reader("apellido_paterno"))
        alumno.apellido_materno = Convert.ToString(reader("apellido_materno"))
        alumno.sexo = Convert.ToString(reader("sexo"))
        alumno.fecha_nacimiento = Convert.ToDateTime(reader("fecha_nacimiento"))
        alumno.direccion = Convert.ToString(reader("direccion"))
        alumno.telefono = Convert.ToString(reader("telefono"))
        alumno.apoderado = Convert.ToString(reader("apoderad"))
        alumno.edad = Convert.ToInt32(reader("edad"))
        alumno.peso = Convert.ToDecimal(reader("peso"))
        alumno.Estado = Convert.ToInt32(reader("estado"))
        alumno.posicion = Convert.ToString(reader("posicion"))
        alumno.fecha_ingreso = Convert.ToDateTime(reader("fecha_ingreso"))
        alumno.categoria_alumno_id = Convert.ToInt32(reader("categoria_alumno_id"))
        alumno.condicion_pago_id = Convert.ToInt32(reader("condicion_pago_id"))

        Return alumno
    End Function
End Class
