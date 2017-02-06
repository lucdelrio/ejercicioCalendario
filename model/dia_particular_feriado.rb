require_relative '../model/feriado'

class DiaParticularFeriado < Feriado

  def initialize (dia_particular)
    @feriado = DateTime.strptime(dia_particular,"%d/%m/%Y")

  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0
    @fecha = DateTime.strptime(dia_a_consultar,"%d/%m/%Y")

    if @fecha == @feriado
      @laborable = 1
    end
    @laborable
  end

end
