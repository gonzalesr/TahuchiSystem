Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class CursoTemporadaDAL

    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarCursoTemporada() As List(Of CursoTemporadaEntity)
        Dim list As New List(Of CursoTemporadaEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTACURSOTEMPORADA")
            While reader.Read
                list.Add(CargarCursoTemporada(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoCursoTemporada() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMOCURSOTEMPORADA"))
        Return codigo
    End Function

    Public Function Guardar(ByVal cursoTemporada As CursoTemporadaEntity) As CursoTemporadaEntity
        cursoTemporada.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVOCURSOTEMPORADA", cursoTemporada))
        Return cursoTemporada
    End Function

    Public Function Actualizar(ByVal cursoTemporada As CursoTemporadaEntity) As CursoTemporadaEntity
        cursoTemporada.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARCURSOTEMPORADA", cursoTemporada))
        Return cursoTemporada
    End Function

    Public Sub Eliminar(ByVal cursoTemporada As CursoTemporadaEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARCURSOTEMPORADA", cursoTemporada.id)
    End Sub

    Private Function CargarCursoTemporada(reader As IDataReader) As CursoTemporadaEntity
        Dim cursoTemporada As New CursoTemporadaEntity
        cursoTemporada.id = Convert.ToInt32(reader("id"))
        cursoTemporada.nombre = Convert.ToString(reader("nombre"))
        cursoTemporada.lugar_entrenamiento_id = Convert.ToInt16(reader("lugar_entrenamiento_id"))
        cursoTemporada.horario_id = Convert.ToString(reader("horario_id"))
        cursoTemporada.tecnico_id = Convert.ToString(reader("tecnico_id"))
        Return cursoTemporada
    End Function
End Class
