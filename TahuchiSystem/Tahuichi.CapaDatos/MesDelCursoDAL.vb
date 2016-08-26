Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class MesDelCursoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarMesDelCurso() As List(Of MesDelCursoEntity)
        Dim list As New List(Of MesDelCursoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaMesDelCurso")
            While reader.Read
                list.Add(CargarMesDelCurso(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoMesDelCurso() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoMesDelCurso"))
        Return codigo
    End Function

    Public Function Guardar(ByVal mesDelCurso As MesDelCursoEntity) As MesDelCursoEntity
        mesDelCurso.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoMesDelCurso", mesDelCurso))
        Return mesDelCurso
    End Function

    Public Function Actualizar(ByVal mesDelCurso As MesDelCursoEntity) As MesDelCursoEntity
        mesDelCurso.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarMesDelCurso", mesDelCurso))
        Return mesDelCurso
    End Function

    Public Sub Eliminar(ByVal mesDelCurso As MesDelCursoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarMesDelCurso", mesDelCurso.id)
    End Sub

    Private Function CargarMesDelCurso(reader As IDataReader) As MesDelCursoEntity
        Dim mesDelCurso As New MesDelCursoEntity
        mesDelCurso.id = Convert.ToInt32(reader("id"))
        mesDelCurso.nombre = Convert.ToString(reader("nombre"))
        Return mesDelCurso
    End Function
End Class
