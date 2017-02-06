require_relative '../model/feriado'

class DiaFeriado < Feriado

  def initialize (dia)
    @feriado = DateTime.strptime(dia,"%d/%m")
  end

  def verificar_feriado (dia_a_consultar)
    @dia = DateTime.strptime(dia_a_consultar,"%d/%m")

    if @dia == @feriado
      @laborable = false
    end
    @laborable
  end

end
