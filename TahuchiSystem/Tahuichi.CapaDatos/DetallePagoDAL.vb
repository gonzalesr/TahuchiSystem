Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data

Public Class DetallePagoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarDetallePago(ByVal idPago As Integer) As List(Of DetallePagoEntity)
        Dim list As New List(Of DetallePagoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaDetallePago", idPago)
            While reader.Read
                list.Add(CargarDetallePago(reader))
            End While
        End Using
        Return list
    End Function

    Public Function Guardar(ByVal detallePago As DetallePagoEntity) As DetallePagoEntity
        detallePago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoDetallPago", detallePago))
        Return detallePago
    End Function

    Public Function Actualizar(ByVal detallePago As DetallePagoEntity) As DetallePagoEntity
        detallePago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarDetallePago", detallePago))
        Return detallePago
    End Function

    Public Sub Eliminar(ByVal detallePago As DetallePagoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarDetallePago", detallePago.id)
    End Sub

    Private Function CargarDetallePago(reader As IDataReader) As DetallePagoEntity
        Dim DetallePago As New DetallePagoEntity
        DetallePago.id = Convert.ToInt32(reader("id"))
        DetallePago.mes_id = Convert.ToInt32(reader("mes_id"))
        DetallePago.pago_id = Convert.ToInt32(reader("pago_id"))
        DetallePago.precio = Convert.ToDecimal(reader("precio"))
        DetallePago.cantidad = Convert.ToInt32(reader("cantidad"))
        DetallePago.precio_total = Convert.ToDecimal(reader("precio_total"))

        Return DetallePago
    End Function
End Class
