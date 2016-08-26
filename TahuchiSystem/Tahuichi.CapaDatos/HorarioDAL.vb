Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class HorarioDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarHorario() As List(Of HorarioEntity)
        Dim list As New List(Of HorarioEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaHorario")
            While reader.Read
                list.Add(CargarHorario(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoHorario() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoHorario"))
        Return codigo
    End Function

    Public Function Guardar(ByVal horario As HorarioEntity) As HorarioEntity
        horario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoHorario", horario))
        Return horario
    End Function

    Public Function Actualizar(ByVal horario As HorarioEntity) As HorarioEntity
        horario.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarHorario", horario))
        Return horario
    End Function

    Public Sub Eliminar(ByVal horario As HorarioEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarHorario", horario.id)
    End Sub

    Private Function CargarHorario(reader As IDataReader) As HorarioEntity
        Dim horario As New HorarioEntity
        horario.id = Convert.ToInt32(reader("id"))
        horario.dias = Convert.ToString(reader("dias"))
        Return horario
    End Function
End Class
