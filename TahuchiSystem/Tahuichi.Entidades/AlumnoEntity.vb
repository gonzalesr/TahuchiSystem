Public Class AlumnoEntity
    Private idvalue As Integer
    Public Property id() As Integer
        Get
            Return idvalue
        End Get
        Set(ByVal value As Integer)
            idvalue = value
        End Set
    End Property
    Private nombrevalue As String
    Public Property nombre() As String
        Get
            Return nombrevalue
        End Get
        Set(ByVal value As String)
            nombrevalue = value
        End Set
    End Property
    Private ape_paterno_value As String
    Public Property apellido_paterno() As String
        Get
            Return ape_paterno_value
        End Get
        Set(ByVal value As String)
            ape_paterno_value = value
        End Set
    End Property
    Private ape_materno_value As String
    Public Property apellido_materno() As String
        Get
            Return ape_materno_value
        End Get
        Set(ByVal value As String)
            ape_materno_value = value
        End Set
    End Property
    Private SexoValue As String
    Public Property sexo() As String
        Get
            Return SexoValue
        End Get
        Set(ByVal value As String)
            SexoValue = value
        End Set
    End Property
    Private fecha_nacimiento_value As DateTime
    Public Property fecha_nacimiento() As DateTime
        Get
            Return fecha_nacimiento_value
        End Get
        Set(ByVal value As DateTime)
            fecha_nacimiento_value = value
        End Set
    End Property

    Private direccion_value As String
    Public Property direccion() As String
        Get
            Return direccion_value
        End Get
        Set(ByVal value As String)
            direccion_value = value
        End Set
    End Property
    Private telefono_value As String
    Public Property telefono() As String
        Get
            Return telefono_value
        End Get
        Set(ByVal value As String)
            telefono_value = value
        End Set
    End Property
    Private apoderado_value As String
    Public Property apoderado() As String
        Get
            Return apoderado_value
        End Get
        Set(ByVal value As String)
            apoderado_value = value
        End Set
    End Property
    Private edad_value As Integer
    Public Property edad() As Integer
        Get
            Return edad_value
        End Get
        Set(ByVal value As Integer)
            edad_value = value
        End Set
    End Property
    Private peso_value As Decimal
    Public Property peso() As Decimal
        Get
            Return peso_value
        End Get
        Set(ByVal value As Decimal)
            peso_value = value
        End Set
    End Property
    Private estado_value As Integer
    Public Property Estado() As Integer
        Get
            Return estado_value
        End Get
        Set(ByVal value As Integer)
            estado_value = value
        End Set
    End Property
    Private posicion_value As String
    Public Property posicion() As String
        Get
            Return posicion_value
        End Get
        Set(ByVal value As String)
            posicion_value = value
        End Set
    End Property
    Private fecha_ingreso_value As DateTime
    Public Property fecha_ingreso() As DateTime
        Get
            Return fecha_ingreso_value
        End Get
        Set(ByVal value As DateTime)
            fecha_ingreso_value = value
        End Set
    End Property
    Private Categoria_alumno_id_value As Integer
    Public Property categoria_alumno_id() As Integer
        Get
            Return Categoria_alumno_id_value
        End Get
        Set(ByVal value As Integer)
            Categoria_alumno_id_value = value
        End Set
    End Property
    Private condicion_pago_id_value As Integer
    Public Property condicion_pago_id() As Integer
        Get
            Return condicion_pago_id_value
        End Get
        Set(ByVal value As Integer)
            condicion_pago_id_value = value
        End Set
    End Property

End Class
