Public Class bitacoraEntity
    Private idValue As Integer
    Public Property id() As Integer
        Get
            Return idValue
        End Get
        Set(ByVal value As Integer)
            idValue = value
        End Set
    End Property
    Private fecha_horaValue As DateTime
    Public Property fecha_hora() As DateTime
        Get
            Return fecha_horaValue
        End Get
        Set(ByVal value As DateTime)
            fecha_horaValue = value
        End Set
    End Property
    Private tablaValue As String
    Public Property tabla() As String
        Get
            Return tablaValue
        End Get
        Set(ByVal value As String)
            tablaValue = value
        End Set
    End Property
    Private registroValue As String
    Public Property registro() As String
        Get
            Return registroValue
        End Get
        Set(ByVal value As String)
            registroValue = value
        End Set
    End Property
    Private usuario_idValue As Integer
    Public Property usuario_id() As Integer
        Get
            Return usuario_idValue
        End Get
        Set(ByVal value As Integer)
            usuario_idValue = value
        End Set
    End Property





End Class
