Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class BecaDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarBeca() As List(Of BecaEntity)
        Dim list As New List(Of BecaEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListadoBeca")
            While reader.Read
                list.Add(CargarBeca(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimaBeca() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMABECA"))
        Return codigo
    End Function

    Public Function Guardar(ByVal beca As BecaEntity) As BecaEntity
        beca.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVABECA", beca))
        Return beca
    End Function

    Public Function Actualizar(ByVal beca As BecaEntity) As BecaEntity
        beca.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARBECA", beca))
        Return beca
    End Function

    Public Sub Eliminar(ByVal beca As BecaEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINABECA", beca.id)
    End Sub

    Private Function CargarBeca(reader As IDataReader) As BecaEntity
        Dim beca As New BecaEntity
        beca.id = Convert.ToInt32(reader("id"))
        beca.nombre = Convert.ToString(reader("nombre"))
        beca.fecha_inicio = Convert.ToDateTime(reader("fecha_inicio"))
        beca.fecha_fin = Convert.ToDateTime(reader("fecha_fin"))
        beca.patrocinador_id = Convert.ToInt32(reader("patrocinador_id"))
        beca.alumno_id = Convert.ToInt32(reader("alumno_id"))

        Return beca
    End Function
End Class
