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
    @dia_laborable = 0
    if @feriados.size > 0
        @feriados.each do |consulta|
          @dia_laborable = consulta.verificar_feriado (dia_a_consultar)
        end
    end

    if @dia_laborable == 1
      @laborable = false
    else
      @laborable = true
    end
    @laborable
  end

end
