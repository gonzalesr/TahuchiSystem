Public Class BecaEntity
    Private id_value As Integer
    Public Property id() As Integer
        Get
            Return id_value
        End Get
        Set(ByVal value As Integer)
            id_value = value
        End Set
    End Property
    Private nombre_value As String
    Public Property nombre() As String
        Get
            Return nombre_value
        End Get
        Set(ByVal value As String)
            nombre_value = value
        End Set
    End Property
    Private FechaInicioValue As DateTime
    Public Property fecha_inicio() As DateTime
        Get
            Return FechaInicioValue
        End Get
        Set(ByVal value As DateTime)
            FechaInicioValue = value
        End Set
    End Property
    Private FechaFinValue As DateTime
    Public Property fecha_fin() As DateTime
        Get
            Return FechaFinValue
        End Get
        Set(ByVal value As DateTime)
            FechaFinValue = value
        End Set
    End Property
    Private patrocinadorValue As Integer
    Public Property patrocinador_id() As Integer
        Get
            Return patrocinadorValue
        End Get
        Set(ByVal value As Integer)
            patrocinadorValue = value
        End Set
    End Property

    Private alumno_id_Value As Integer
    Public Property alumno_id() As Integer
        Get
            Return alumno_id_Value
        End Get
        Set(ByVal value As Integer)
            alumno_id_Value = value
        End Set
    End Property


End Class
