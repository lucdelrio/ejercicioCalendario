require_relative '../model/feriado'

class DiaParticularFeriado < Feriado

  def initialize (dia_particular)
    @feriado = DateTime.strptime(dia_particular,"%d/%m/%Y")

  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0
    @dia = dia_a_consultar

    if @dia == @feriado
      @laborable = 1
    end
    @laborable
  end

end
