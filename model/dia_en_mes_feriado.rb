require_relative '../model/feriado'

class DiaEnMesFeriado < Feriado

  def initialize (dia)
    @feriado = DateTime.strptime(dia,"%d/%m")
  end

  def verificar_feriado (dia_a_consultar)
    dia = DateTime.strptime(dia_a_consultar,"%d/%m")

    if dia == @feriado
      laborable = false
    else
      laborable = true
    end
    return laborable
  end

end
