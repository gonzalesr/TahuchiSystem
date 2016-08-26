Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class PagoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarPago() As List(Of PagoEntity)
        Dim list As New List(Of PagoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaPago")
            While reader.Read
                list.Add(CargarPago(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoPago() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoPago"))
        Return codigo
    End Function



    Public Function Guardar(ByVal pago As PagoEntity) As PagoEntity
        pago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoPago", pago))
        Return pago
    End Function

    Public Function Actualizar(ByVal pago As PagoEntity) As PagoEntity
        pago.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARPago", pago))
        Return pago
    End Function

    Public Sub Eliminar(ByVal pago As PagoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARPago", pago.id)
    End Sub

    Private Function CargarPago(reader As IDataReader) As PagoEntity
        Dim pago As New PagoEntity
        Pago.id = Convert.ToInt32(reader("id"))
        Pago.fecha = Convert.ToDateTime(reader("fecha"))
        pago.descuento = Convert.ToDecimal(reader("descuento"))
        Pago.monto = Convert.ToDecimal(reader("monto"))
        Pago.glosa = Convert.ToString(reader("glosa"))
        Pago.usuario_id = Convert.ToInt32(reader("usuario_id"))
        Return pago
    End Function
End Class
