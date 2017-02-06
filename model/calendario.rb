require 'date'
require_relative '../model/feriado'


class Calendario

  attr_accessor :feriados

  def initialize
    @feriados = Array.new {}
  end

  def agregar_feriado (feriado)
    @feriados.push feriado
  end

  def consultar_dia_laborable (dia_a_consultar)
    @dia_laborable = true
    if @feriados.size > 0
      @feriados.each do |feriado|
        laborable = feriado.verificar_feriado (dia_a_consultar)
        if laborable == false
          @dia_laborable = laborable
        end
      end
    end
    @dia_laborable
  end
end
