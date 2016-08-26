
Imports Tahuichi.CapaDatos
Imports Tahuichi.Entidades
Imports System.Text
Imports System.Collections.Generic
Imports System.Linq
Imports System.Transactions
Public Class CategoriaAlumnoNE
    'El uso de la clase StringBuilder nos ayudara a devolver los mensajes de las validaciones
    Private _CategoriaAlumnoCD As New CategoriaAlumnosDAL
    

    Public ReadOnly stringBuilder As New StringBuilder()

    Public Function ListaCategoriaAlumno() As List(Of CategoriaAlumnoEntity)
        Return _CategoriaAlumnoCD.ListarCategoriaAlumno
    End Function

    Public Function UltimaCategoriaAlumno() As Integer
        If _CategoriaAlumnoCD.UltimaCategoriaAlumno = "" Then
            Return 1
        Else
            Return _CategoriaAlumnoCD.UltimaCategoriaAlumno + 1

        End If
    End Function


    Public Sub Guardar(ByVal categoriaAlumno As CategoriaAlumnoEntity)
        If ValidarCategoriaAlumno(categoriaAlumno) Then
            REM inicializo las transacciones
            Using scope As New TransactionScope

                _CategoriaAlumnoCD.Guardar(categoriaAlumno)

                scope.Complete()
            End Using
        End If
    End Sub

    Public Sub Actualizar(ByVal categoriaAlumno As CategoriaAlumnoEntity)
        If ValidarCategoriaAlumno(categoriaAlumno) Then
            REM inicializo las transacciones
            Using scope As New TransactionScope

                _CategoriaAlumnoCD.Actualizar(categoriaAlumno)

                scope.Complete()
            End Using
        End If
    End Sub
    Public Sub Eliminar(CatAl_Codigo As Integer)
        stringBuilder.Clear()
        If CatAl_Codigo = 0 Then
            stringBuilder.Append("Por favor proporcione un valor del Código válido!!!")
            Exit Sub
        End If
        'If _CategoriaAlumnoCD.VerificarMovimiento(numSerial) Then
        '    stringBuilder.Append("El producto tiene movimientos relacionados y no puede eliminarse")
        'End If
        If stringBuilder.Length = 0 Then
            _CategoriaAlumnoCD.Eliminar(CatAl_Codigo)
        End If
    End Sub
    

    Private Function ValidarCategoriaAlumno(categoriaAlumno As CategoriaAlumnoEntity) As Boolean
        stringBuilder.Clear()

        If String.IsNullOrEmpty(categoriaAlumno.id) Then
            stringBuilder.Append("Ingrese un Codigo de Categoria Alumno")
        End If

        If String.IsNullOrEmpty(categoriaAlumno.Nombre) Then
            stringBuilder.Append(Environment.NewLine + "Debe introducir el nombre de la categoria alumno")
        End If

        If String.IsNullOrEmpty(categoriaAlumno.Edad) Then
            stringBuilder.Append(Environment.NewLine + "Debe introducir la edad de la categoria alumno")
        End If
        Return stringBuilder.Length = 0
    End Function
End Class
