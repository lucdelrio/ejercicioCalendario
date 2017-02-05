require_relative '../model/feriado'

class DiaFeriado < Feriado

  def initialize (dia)
    @feriado = dia
  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0

    @dia = dia_a_consultar.strftime ("%d/%m")

    if @dia == @feriado
      @laborable = 1
    end
    @laborable
  end

end
