Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class PrivilegioDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarPrivilegio() As List(Of PrivilegioEntity)
        Dim list As New List(Of PrivilegioEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaPrivilegio")
            While reader.Read
                list.Add(CargarPrivilegio(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoPrivilegio() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoPrivilegio"))
        Return codigo
    End Function



    Public Function Guardar(ByVal privilegio As PrivilegioEntity) As PrivilegioEntity
        privilegio.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoPrivilegio", privilegio))
        Return privilegio
    End Function

    Public Function Actualizar(ByVal privilegio As PrivilegioEntity) As PrivilegioEntity
        privilegio.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarPrivilegio", privilegio))
        Return privilegio
    End Function

    Public Sub Eliminar(ByVal privilegio As PrivilegioEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarPrivilegio", privilegio.id)
    End Sub

    Private Function CargarPrivilegio(reader As IDataReader) As PrivilegioEntity
        Dim privilegio As New PrivilegioEntity
        privilegio.id = Convert.ToInt32(reader("id"))
        privilegio.nombre = Convert.ToString(reader("nombre"))
        Return privilegio
    End Function
End Class
