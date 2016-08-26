Public Class TecnicoEntity
    Private idValue As Integer
    Public Property id() As Integer
        Get
            Return idValue
        End Get
        Set(ByVal value As Integer)
            idValue = value
        End Set
    End Property
    Private carnet_identidadValue As String
    Public Property carnet_identidad() As String
        Get
            Return carnet_identidadValue
        End Get
        Set(ByVal value As String)
            carnet_identidadValue = value
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
    Private apellido_paternoValue As String
    Public Property apellido_paterno() As String
        Get
            Return apellido_paternoValue
        End Get
        Set(ByVal value As String)
            apellido_paternoValue = value
        End Set
    End Property
    Private apellido_maternoValue As String
    Public Property apellido_materno() As String
        Get
            Return apellido_maternoValue
        End Get
        Set(ByVal value As String)
            apellido_maternoValue = value
        End Set
    End Property
    Private fecha_nacimientoValue As DateTime
    Public Property fecha_nacimiento() As DateTime
        Get
            Return fecha_nacimientoValue
        End Get
        Set(ByVal value As DateTime)
            fecha_nacimientoValue = value
        End Set
    End Property
    Private sexoValue As String
    Public Property sexo() As String
        Get
            Return sexoValue
        End Get
        Set(ByVal value As String)
            sexoValue = value
        End Set
    End Property
    Private telefonoValue As String
    Public Property telefono() As String
        Get
            Return telefonoValue
        End Get
        Set(ByVal value As String)
            telefonoValue = value
        End Set
    End Property
    Private direccionValue As String
    Public Property direccion() As String
        Get
            Return direccionValue
        End Get
        Set(ByVal value As String)
            direccionValue = value
        End Set
    End Property
    Private fecha_ingresoValue As DateTime
    Public Property fecha_ingreso() As DateTime
        Get
            Return fecha_ingresoValue
        End Get
        Set(ByVal value As DateTime)
            fecha_ingresoValue = value
        End Set
    End Property
    Private estadoValue As Integer
    Public Property estado() As Integer
        Get
            Return estadoValue
        End Get
        Set(ByVal value As Integer)
            estadoValue = value
        End Set
    End Property
    Private categoria_tecnicoValue As Integer
    Public Property categoria_tecnico_id() As Integer
        Get
            Return categoria_tecnicoValue
        End Get
        Set(ByVal value As Integer)
            categoria_tecnicoValue = value
        End Set
    End Property









End Class
