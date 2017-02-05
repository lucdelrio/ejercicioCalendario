require_relative '../model/feriado'

class DiaSemanaFeriado < Feriado

  def initialize (dia_semana)
    @feriado = dia_semana.downcase
  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0

    @dia = dia_a_consultar.strftime ("%A")
    @dia = @dia.downcase

    if @dia == @feriado
      @laborable = 1
    end
    @laborable
  end

end