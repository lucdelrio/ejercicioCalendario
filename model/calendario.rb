class Calendario

  def initialize
    @feriados = Array.new
  end

  def agregar_feriado (feriado)
    @feriados.push feriado
  end

  def consultar_dia_laborable (dia_a_consultar)
    if @feriados.any? {|feriado|feriado.verificar_feriado (dia_a_consultar)}
      return false
    else
      return true
    end
  end
end
