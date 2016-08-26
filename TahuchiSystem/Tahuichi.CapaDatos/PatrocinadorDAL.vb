Imports System.Data.SqlClient
Imports System.Configuration
Imports Tahuichi.Entidades
Imports Microsoft.ApplicationBlocks.Data
Public Class PatrocinadorDAL
    Private conexion As String = ConfigurationManager.ConnectionStrings("TahuchiSystem.My.MySettings.conex").ConnectionString

    Public Function ListarPatrocinador() As List(Of PatrocinadorEntity)
        Dim list As New List(Of PatrocinadorEntity)
        Using reader As SqlDataReader = SqlHelper.ExecuteReader(conexion, "ListaPatrocinador")
            While reader.Read
                list.Add(CargarPatrocinador(reader))
            End While
        End Using
        Return list
    End Function

    Public Function UltimoPatrocinador() As Integer
        Dim codigo As Integer = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "UltimoPatrocinador"))
        Return codigo
    End Function



    Public Function Guardar(ByVal patrocinador As PatrocinadorEntity) As PatrocinadorEntity
        patrocinador.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "NuevoPatrocinador", patrocinador))
        Return patrocinador
    End Function

    Public Function Actualizar(ByVal patrocinador As PatrocinadorEntity) As PatrocinadorEntity
        patrocinador.id = Convert.ToInt32(SqlHelper.ExecuteScalar(conexion, "ActualizarPatrocinador", patrocinador))
        Return patrocinador
    End Function

    Public Sub Eliminar(ByVal patrocinador As PatrocinadorEntity)
        SqlHelper.ExecuteNonQuery(conexion, "EliminarPatrocinador", patrocinador.id)
    End Sub

    Private Function CargarPatrocinador(reader As IDataReader) As PatrocinadorEntity
        Dim patrocinador As New PatrocinadorEntity
        patrocinador.id = Convert.ToInt32(reader("id"))
        patrocinador.nombre = Convert.ToString(reader("nombre"))
        Return patrocinador
    End Function
End Class
