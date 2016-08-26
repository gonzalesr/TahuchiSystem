Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class LugarEntrenamientoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarLugarEntrenamiento() As List(Of LugarEntrenamientoEntity)
        Dim list As New List(Of LugarEntrenamientoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaLugarEntrenamiento")
            While reader.Read
                list.Add(CargarLugarEntrenamiento(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoLugarEnt() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoLugarEntrenamiento"))
        Return codigo
    End Function



    Public Function Guardar(ByVal lugarEntrenamiento As LugarEntrenamientoEntity) As LugarEntrenamientoEntity
        lugarEntrenamiento.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoLugarEntrenamiento", lugarEntrenamiento))
        Return lugarEntrenamiento
    End Function

    Public Function Actualizar(ByVal lugarEntrenamiento As LugarEntrenamientoEntity) As LugarEntrenamientoEntity
        lugarEntrenamiento.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarLugarEntrenamiento", lugarEntrenamiento))
        Return lugarEntrenamiento
    End Function

    Public Sub Eliminar(ByVal lugarEntrenamiento As LugarEntrenamientoEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarLugarEntrenamiento", lugarEntrenamiento.id)
    End Sub

    Private Function CargarLugarEntrenamiento(reader As IDataReader) As LugarEntrenamientoEntity
        Dim lugarEntrenamiento As New LugarEntrenamientoEntity
        lugarEntrenamiento.id = Convert.ToInt32(reader("id"))
        lugarEntrenamiento.nombre = Convert.ToString(reader("nombre"))
        Return lugarEntrenamiento
    End Function
End Class
