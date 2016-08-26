Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class TipoUsuarioDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarTipoUsuario() As List(Of TipoUsuarioEntity)
        Dim list As New List(Of TipoUsuarioEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaTipoUsuario")
            While reader.Read
                list.Add(CargarTipoUsuario(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoTipoUsuario() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoTipoUsuario"))
        Return codigo
    End Function

    Public Function Guardar(ByVal tipoUsuario As TipoUsuarioEntity) As TipoUsuarioEntity
        tipoUsuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoTipoUsuario", tipoUsuario))
        Return tipoUsuario
    End Function

    Public Function Actualizar(ByVal tipoUsuario As TipoUsuarioEntity) As TipoUsuarioEntity
        tipoUsuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarTipoUsuario", tipoUsuario))
        Return tipoUsuario
    End Function

    Public Sub Eliminar(ByVal tipoUsuario As TipoUsuarioEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarTipoUsuario", tipoUsuario.id)
    End Sub

    Private Function CargarTipoUsuario(reader As IDataReader) As TipoUsuarioEntity
        Dim tipoUsuario As New TipoUsuarioEntity
        tipoUsuario.id = Convert.ToInt32(reader("id"))
        tipoUsuario.nombre = Convert.ToString(reader("nombre"))

        Return tipoUsuario
    End Function
End Class
