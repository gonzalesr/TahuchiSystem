Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class TipoUsuarioPrivilegioDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function Guardar(ByVal tipoUsuario As TipoUsuarioEntity, ByVal privilegio As PrivilegioEntity) As TipoUsuarioEntity
        tipoUsuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevotipoUsuarioPrivilegio", tipoUsuario.id, privilegio.id))
        Return tipoUsuario
    End Function REM REVISAR..

    Public Function Actualizar(ByVal tipoUsuario As TipoUsuarioEntity, ByVal privilegio As PrivilegioEntity) As TipoUsuarioEntity
        tipoUsuario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarTipoUsuarioPrivilegio", tipoUsuario.id, privilegio.id))
        Return tipoUsuario
    End Function

    Public Sub Eliminar(ByVal tipoUsuario As TipoUsuarioEntity, ByVal privilegio As PrivilegioEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarTipoUsuarioPrivilegio", tipoUsuario.id, privilegio.id)
    End Sub
End Class
