﻿Public Class CategoriaAlumnoEntity
    Private idValue As Integer
    Public Property id() As Integer
        Get
            Return idValue
        End Get
        Set(ByVal value As Integer)
            idValue = value
        End Set
    End Property
    Private nombreValue As String
    Public Property nombre() As String
        Get
            Return nombreValue
        End Get
        Set(ByVal value As String)
            nombreValue = value
        End Set
    End Property
    Private edadValue As Integer
    Public Property edad() As Integer
        Get
            Return edadValue
        End Get
        Set(ByVal value As Integer)
            edadValue = value
        End Set
    End Property

End Class
