class DiaSemanaPorRangoFeriado < Feriado

  def initialize (inicio, fin, dia_semana)
    @feriado = dia_semana.downcase
    @inicio_rango = DateTime.strptime(inicio,"%d/%m/%Y")
    @fin_rango = DateTime.strptime(fin,"%d/%m/%Y")
  end

  def verificar_feriado (dia_a_consultar)
    fecha = DateTime.strptime(dia_a_consultar,"%d/%m/%Y")
    laborable = true
    if fecha.between?(@inicio_rango,@fin_rango)
      dia = fecha.strftime ("%A")
      dia = dia.downcase

      if dia == @feriado
        laborable = false
      end
    end
    laborable
  end
end
