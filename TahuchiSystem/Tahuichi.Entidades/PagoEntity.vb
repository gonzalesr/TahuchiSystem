Public Class PagoEntity
    Private idvalue As Integer
    Public Property id() As Integer
        Get
            Return idvalue
        End Get
        Set(ByVal value As Integer)
            idvalue = value
        End Set
    End Property
    Private fechaValue As DateTime
    Public Property fecha() As DateTime
        Get
            Return fechaValue
        End Get
        Set(ByVal value As DateTime)
            fechaValue = value
        End Set
    End Property
    Private descuentoValue As Decimal
    Public Property descuento() As Decimal
        Get
            Return descuentoValue
        End Get
        Set(ByVal value As Decimal)
            descuentoValue = value
        End Set
    End Property
    Private montoValue As Decimal
    Public Property monto() As Decimal
        Get
            Return montoValue
        End Get
        Set(ByVal value As Decimal)
            montoValue = value
        End Set
    End Property
    Private glosaValue As String
    Public Property glosa() As String
        Get
            Return glosaValue
        End Get
        Set(ByVal value As String)
            glosaValue = value
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
