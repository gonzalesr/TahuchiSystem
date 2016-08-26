Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class BitacoraDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarBitacora() As List(Of bitacoraEntity)
        Dim list As New List(Of bitacoraEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTADOBITACORA")
            While reader.Read
                list.Add(CargarBitacora(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimaBitacora() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMABITACORA"))
        Return codigo
    End Function

    Public Function Guardar(ByVal bitacora As bitacoraEntity) As bitacoraEntity
        bitacora.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVABITACORA", bitacora))
        Return bitacora
    End Function

    Public Function Actualizar(ByVal bitacora As bitacoraEntity) As bitacoraEntity
        bitacora.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ACTUALIZARBITACORA", bitacora))
        Return bitacora
    End Function

    Public Sub Eliminar(ByVal bitacora As bitacoraEntity)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARBITACORA", bitacora.id)
    End Sub

    Private Function CargarBitacora(reader As IDataReader) As bitacoraEntity
        Dim bitacora As New bitacoraEntity
        bitacora.id = Convert.ToInt32(reader("id"))
        bitacora.fecha_hora = Convert.ToDateTime(reader("fecha_hora"))
        bitacora.tabla = Convert.ToString(reader("tabla"))
        bitacora.registro = Convert.ToString(reader("registro"))
        bitacora.usuario_id = Convert.ToInt32(reader("usuario_id"))
        Return bitacora
    End Function
End Class
