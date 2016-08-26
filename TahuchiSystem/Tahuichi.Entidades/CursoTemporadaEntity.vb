Public Class CursoTemporadaEntity
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
    Private lugar_entrenamiento_idValue As Integer
    Public Property lugar_entrenamiento_id() As Integer
        Get
            Return lugar_entrenamiento_idValue
        End Get
        Set(ByVal value As Integer)
            lugar_entrenamiento_idValue = value
        End Set
    End Property
    Private horario_idValue As Integer
    Public Property horario_id() As Integer
        Get
            Return horario_idValue
        End Get
        Set(ByVal value As Integer)
            horario_idValue = value
        End Set
    End Property
    Private tecnico_idValue As Integer
    Public Property tecnico_id() As Integer
        Get
            Return tecnico_idValue
        End Get
        Set(ByVal value As Integer)
            tecnico_idValue = value
        End Set
    End Property





End Class
