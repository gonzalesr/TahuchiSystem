Public Class PrivilegioEntity
    Private idValue As String
    Public Property id() As String
        Get
            Return idValue
        End Get
        Set(ByVal value As String)
            idValue = value
        End Set
    End Property
    Private nombreValue As String
    Public Property nombre As String
        Get
            Return nombreValue
        End Get
        Set(ByVal value As String)
            nombreValue = value
        End Set
    End Property

End Class
