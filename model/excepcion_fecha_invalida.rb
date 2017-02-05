class ExcepcionFechaInvalida < Exception

  def initialize(msg='Ha ingresado una fecha invalida. El formato valido es: dd/mm/yyyy')
    super
  end
end
