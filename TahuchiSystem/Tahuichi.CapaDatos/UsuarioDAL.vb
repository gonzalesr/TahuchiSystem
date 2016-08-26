Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class UsuarioDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarUsuario() As List(Of UsuarioEntity)
        Dim list As New List(Of UsuarioEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaUsuario")
            While reader.Read
                list.Add(CargarUsuario(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoUsuario() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoUsuario"))
        Return codigo
    End Function



    Public Function Guardar(ByVal usuario As UsuarioEntity) As UsuarioEntity
        usuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoUsuario", usuario))
        Return usuario
    End Function

    Public Function Actualizar(ByVal usuario As UsuarioEntity) As UsuarioEntity
        usuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarUsuario", usuario))
        Return usuario
    End Function

    Public Sub Eliminar(ByVal usuario As UsuarioEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarUsuario", usuario.id)
    End Sub

    Private Function CargarUsuario(reader As IDataReader) As UsuarioEntity
        Dim usuario As New UsuarioEntity
        usuario.id = Convert.ToInt32(reader("id"))
        usuario.login = Convert.ToString(reader("login"))
        usuario.password = Convert.ToString(reader("password"))
        usuario.nombre = Convert.ToString(reader("nombre"))
        usuario.direccion = Convert.ToString(reader("direccion"))
        usuario.telefono = Convert.ToString(reader("telefono"))
        usuario.fecha_registro = Convert.ToString(reader("fecha_registro"))
        usuario.estado = Convert.ToInt32(reader("estado"))
        usuario.tipo_usuario_id = Convert.ToString(reader("tipo_usuario_id"))
       
        Return usuario
    End Function
End Class
