Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class CategoriaAlumnosDAL

    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarCategoriaAlumno() As List(Of CategoriaAlumnoEntity)
        Dim list As New List(Of CategoriaAlumnoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTACATEGORIAALUMNO")
            While reader.Read
                list.Add(CargarCategoriaAlumno(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimaCategoriaAlumno() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMACATEGORIAALUMNO"))
        Return codigo
    End Function



    Public Function Guardar(ByVal catAlumno As CategoriaAlumnoEntity) As CategoriaAlumnoEntity
        catAlumno.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVACATEGORIAALUMNO", catAlumno))
        Return catAlumno
    End Function

    Public Function Actualizar(ByVal catAlumno As CategoriaAlumnoEntity) As CategoriaAlumnoEntity
        catAlumno.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARCATEGORIAALUMNOS", catAlumno))
        Return catAlumno
    End Function

    Public Sub Eliminar(ByVal catAlumnoCodigo As Integer)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARCATEGORIAALUMNO", catAlumnoCodigo)
    End Sub

    Private Function CargarCategoriaAlumno(reader As IDataReader) As CategoriaAlumnoEntity
        Dim categoriAlumno As New CategoriaAlumnoEntity
        categoriAlumno.id = Convert.ToInt32(reader("id"))
        categoriAlumno.nombre = Convert.ToString(reader("nombre"))
        categoriAlumno.edad = Convert.ToInt32(reader("edad"))

        Return categoriAlumno
    End Function
End Class
