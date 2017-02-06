require_relative '../model/feriado'

class DiaPorRangoFeriado < Feriado

  def initialize (inicio, fin, dia)
    @feriado = DateTime.strptime(dia,"%d/%m")
    @inicio_rango = DateTime.strptime(inicio,"%d/%m/%Y")
    @fin_rango = DateTime.strptime(fin,"%d/%m/%Y")
  end

  def verificar_feriado (dia_a_consultar)
    @laborable = 0
    @fecha = DateTime.strptime(dia_a_consultar,"%d/%m/%Y")

    if @fecha.between?(@inicio_rango,@fin_rango)

      @dia_a_consultar = DateTime.strptime(dia_a_consultar,"%d/%m")
      if @dia_a_consultar == @feriado
        @laborable = 1
      end
    end
    @laborable
  end
end
