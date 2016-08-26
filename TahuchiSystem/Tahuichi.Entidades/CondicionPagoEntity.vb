Public Class CondicionPagoEntity
    Private CodigoValue As Integer
    Public Property id() As Integer
        Get
            Return CodigoValue
        End Get
        Set(ByVal value As Integer)
            CodigoValue = value
        End Set
    End Property
    Private NombreValue As String
    Public Property nombre() As String
        Get
            Return NombreValue
        End Get
        Set(ByVal value As String)
            NombreValue = value
        End Set
    End Property


End Class
