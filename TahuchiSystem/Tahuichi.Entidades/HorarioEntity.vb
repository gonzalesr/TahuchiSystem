Public Class HorarioEntity
    Private idvalue As Integer
    Public Property id() As Integer
        Get
            Return idvalue
        End Get
        Set(ByVal value As Integer)
            idvalue = value
        End Set
    End Property
    Private diasValue As Integer
    Public Property dias() As Integer
        Get
            Return diasValue
        End Get
        Set(ByVal value As Integer)
            diasValue = value
        End Set
    End Property

End Class
