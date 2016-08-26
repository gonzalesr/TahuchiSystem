Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class CondicionPagoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarCondicionPago() As List(Of CondicionPagoEntity)
        Dim list As New List(Of CondicionPagoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTACONDICIONPAGO")
            While reader.Read
                list.Add(CargarCondicionPago(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimaCondicionPago() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMACONDICIONPAGO"))
        Return codigo
    End Function

    Public Function Guardar(ByVal condicionPago As CondicionPagoEntity) As CondicionPagoEntity
        condicionPago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVACONDICIONPAGO", condicionPago))
        Return condicionPago
    End Function

    Public Function Actualizar(ByVal condicionPago As CondicionPagoEntity) As CondicionPagoEntity
        condicionPago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARCONDICIONPAGO", condicionPago))
        Return condicionPago
    End Function

    Public Sub Eliminar(ByVal condicionPago As CondicionPagoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARCONDICIONPAGO", condicionPago.id)
    End Sub

    Private Function CargarCondicionPago(reader As IDataReader) As CondicionPagoEntity
        Dim condicionPago As New CondicionPagoEntity
        condicionPago.id = Convert.ToInt32(reader("id"))
        condicionPago.nombre = Convert.ToString(reader("nombre"))
        Return condicionPago
    End Function

End Class
