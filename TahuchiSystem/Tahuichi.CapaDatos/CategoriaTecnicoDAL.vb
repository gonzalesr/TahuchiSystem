Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class CategoriaTecnicoDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarCategoriaTecnico() As List(Of CategoriaTecnicoEntity)
        Dim list As New List(Of CategoriaTecnicoEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "LISTACATEGORIATECNICO")
            While reader.Read
                list.Add(CargarCategoriaTecnico(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimaCategoriaTecnico() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ULTIMACATEGORIATECNICO"))
        Return codigo
    End Function



    Public Function Guardar(ByVal categoriaTecnico As CategoriaTecnicoEntity) As CategoriaTecnicoEntity
        categoriaTecnico.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NUEVACATEGORIATECNICO", categoriaTecnico))
        Return categoriaTecnico
    End Function

    Public Function Actualizar(ByVal categoriaTecnico As CategoriaTecnicoEntity) As CategoriaTecnicoEntity
        categoriaTecnico.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarCategoriaTecnico", categoriaTecnico))
        Return categoriaTecnico
    End Function

    Public Sub Eliminar(ByVal categoriaTecnico As Integer)
        SqlHelper.ExecuteNonQuery(conexion, "ELIMINARCATEGORIATECNICO", categoriaTecnico)
    End Sub

    Private Function CargarCategoriaTecnico(reader As IDataReader) As CategoriaTecnicoEntity
        Dim categoriaTecnico As New CategoriaTecnicoEntity
        categoriaTecnico.id = Convert.ToInt32(reader("id"))
        categoriaTecnico.nombre = Convert.ToString(reader("nombre"))

        Return categoriaTecnico
    End Function
End Class
