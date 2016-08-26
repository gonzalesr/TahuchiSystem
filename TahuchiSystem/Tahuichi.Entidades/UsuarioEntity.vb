Public Class UsuarioEntity
    Private idValue As Integer
    Public Property id() As Integer
        Get
            Return idValue
        End Get
        Set(ByVal value As Integer)
            idValue = value
        End Set
    End Property
    Private loginValue As String
    Public Property login() As String
        Get
            Return loginValue
        End Get
        Set(ByVal value As String)
            loginValue = value
        End Set
    End Property
    Private passwordValue As String
    Public Property password() As String
        Get
            Return passwordValue
        End Get
        Set(ByVal value As String)
            passwordValue = value
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
    Private direccionValue As String
    Public Property direccion() As String
        Get
            Return direccionValue
        End Get
        Set(ByVal value As String)
            direccionValue = value
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
    Private fecha_registroValue As DateTime
    Public Property fecha_registro() As DateTime
        Get
            Return fecha_registroValue
        End Get
        Set(ByVal value As DateTime)
            fecha_registroValue = value
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
    Private tipo_usuaro_idValue As Integer
    Public Property tipo_usuario_id() As Integer
        Get
            Return tipo_usuaro_idValue
        End Get
        Set(ByVal value As Integer)
            tipo_usuaro_idValue = value
        End Set
    End Property







End Class
