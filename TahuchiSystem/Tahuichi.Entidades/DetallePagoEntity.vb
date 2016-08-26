Public Class DetallePagoEntity
    Private idValue As Integer
    Public Property id() As Integer
        Get
            Return idValue
        End Get
        Set(ByVal value As Integer)
            idValue = value
        End Set
    End Property
    Private mes_idValue As Integer
    Public Property mes_id() As Integer
        Get
            Return mes_idValue
        End Get
        Set(ByVal value As Integer)
            mes_idValue = value
        End Set
    End Property
    Private pago_idValue As Integer
    Public Property pago_id() As Integer
        Get
            Return pago_idValue
        End Get
        Set(ByVal value As Integer)
            pago_idValue = value
        End Set
    End Property
    Private precioValue As Double
    Public Property precio() As Decimal
        Get
            Return precioValue
        End Get
        Set(ByVal value As Decimal)
            precioValue = value
        End Set
    End Property
    Private cantidadValue As Integer
    Public Property cantidad() As Integer
        Get
            Return cantidadValue
        End Get
        Set(ByVal value As Integer)
            cantidadValue = value
        End Set
    End Property
    Private precio_totalValue As Double
    Public Property precio_total() As Decimal
        Get
            Return precio_totalValue
        End Get
        Set(ByVal value As Decimal)
            precio_totalValue = value
        End Set
    End Property




End Class
