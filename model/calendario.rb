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
    @fecha = DateTime.strptime(dia_a_consultar,"%d/%m/%Y")
    @dia_laborable = 0
    if @feriados != nil && @feriados.size > 0
        @feriados.each do |consulta|
          @dia_laborable = consulta.verificar_feriado (@fecha)
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
