
class DiaSemanaPorRangoFeriado < Feriado

  def initialize (inicio, fin, dia_semana)
    @feriado = dia_semana.downcase
    @inicio_rango = DateTime.strptime(inicio,"%d/%m/%Y")
    @fin_rango = DateTime.strptime(fin,"%d/%m/%Y")
  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0
    if dia_a_consultar >= @inicio_rango && dia_a_consultar <= @fin_rango
      @dia = dia_a_consultar.strftime ("%A")
      @dia = @dia.downcase

      if @dia == @feriado
        @laborable = 1
      end
    end
    @laborable
  end
end
