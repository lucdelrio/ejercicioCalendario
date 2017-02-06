require 'rspec'
require 'spec_helper'
require_relative '../model/feriado'
require_relative '../model/dia_semana_por_rango_feriado'

describe 'Dia semana es Feriado por un rango de tiempo' do

  it 'Se establece Sabado feriado por un rango de validez espera laborable' do
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2016', '30/03/2017', 'SATURDAY')
    dia_a_consultar = '08/09/2016'
    laborable = nil
    expect(dia_semana_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

  it 'Se establece Sabado feriado por un rango de validez espera laborable probando fuera de rango' do
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2016', '30/03/2017', 'SATURDAY')
    dia_a_consultar = '14/09/2019'
    laborable = nil
    expect(dia_semana_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

  it 'Se establece Lunes feriado por un rango de validez espera no laborable' do
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2016', '30/03/2017', 'Monday')
    dia_a_consultar = '17/10/2016'
    laborable = false
    expect(dia_semana_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

end
