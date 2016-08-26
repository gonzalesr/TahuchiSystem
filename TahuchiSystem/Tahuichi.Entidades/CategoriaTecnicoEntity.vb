Public Class CategoriaTecnicoEntity
    Private idvalue As Integer
    Public Property id() As Integer
        Get
            Return idvalue
        End Get
        Set(ByVal value As Integer)
            idvalue = value
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


End Class
