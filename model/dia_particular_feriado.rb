require_relative '../model/feriado'

class DiaParticularFeriado < Feriado

  def initialize (dia_particular)
    @feriado = DateTime.strptime(dia_particular,"%d/%m/%Y")

  end

  def verificar_feriado (dia_a_consultar)
    @fecha = DateTime.strptime(dia_a_consultar,"%d/%m/%Y")

    if @fecha == @feriado
      @laborable = false
    end
    @laborable
  end

end
