Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class CursoTemporadaMesRelDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function Guardar(ByVal cursoTemporada As CursoTemporadaEntity, ByVal mes As MesDelCursoEntity) As CursoTemporadaEntity
        cursoTemporada.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoCursoTemporadaMes", cursoTemporada.id, mes.id))
        Return cursoTemporada REM REVISAR....
    End Function

    Public Function Actualizar(ByVal cursoTemporada As CursoTemporadaEntity, ByVal mes As MesDelCursoEntity) As CursoTemporadaEntity
        cursoTemporada.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarCursoTemporadaMes", cursoTemporada.id, mes.id))
        Return cursoTemporada
    End Function

    Public Sub Eliminar(ByVal cursoTemporada As CursoTemporadaEntity, ByVal mes As MesDelCursoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarCursoTemporadaMes", cursoTemporada.id, mes.id)
    End Sub

End Class
