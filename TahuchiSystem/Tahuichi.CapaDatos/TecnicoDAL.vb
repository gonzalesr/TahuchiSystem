Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class TecnicoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarTecnico() As List(Of TecnicoEntity)
        Dim list As New List(Of TecnicoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaTecnico")
            While reader.Read
                list.Add(CargarTecnico(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoTecnico() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoTecnico"))
        Return codigo
    End Function



    Public Function Guardar(ByVal tecnico As TecnicoEntity) As TecnicoEntity
        tecnico.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoTecnico", tecnico))
        Return tecnico
    End Function

    Public Function Actualizar(ByVal tecnico As TecnicoEntity) As TecnicoEntity
        tecnico.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarTecnico", tecnico))
        Return tecnico
    End Function

    Public Sub Eliminar(ByVal tecnico As TecnicoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarTecnico", tecnico.id)
    End Sub

    Private Function CargarTecnico(reader As IDataReader) As TecnicoEntity
        Dim tecnico As New TecnicoEntity
        tecnico.id = Convert.ToInt32(reader("id"))
        tecnico.carnet_identidad = Convert.ToString(reader("carnet_identidad"))
        tecnico.nombre = Convert.ToString(reader("nombre"))
        tecnico.apellido_paterno = Convert.ToString(reader("apellido_paterno"))
        tecnico.apellido_materno = Convert.ToString(reader("apellido_materno"))
        tecnico.fecha_nacimiento = Convert.ToDateTime(reader("fecha_nacimiento"))
        tecnico.sexo = Convert.ToString(reader("sexo"))
        tecnico.telefono = Convert.ToString(reader("telefono"))
        tecnico.direccion = Convert.ToString(reader("direccion"))
        tecnico.fecha_ingreso = Convert.ToDateTime(reader("fecha_ingreso"))
        tecnico.estado = Convert.ToInt32(reader("estado"))
        tecnico.categoria_tecnico_id = Convert.ToInt32(reader("categoria_tecnico_id"))

        Return tecnico
    End Function
End Class
