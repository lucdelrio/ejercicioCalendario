require 'rspec'
require 'spec_helper'
require_relative '../model/feriado'
require_relative '../model/dia_en_mes_feriado'

describe 'Dia en un mes Feriado' do

  it 'Se establece dia de mes feriado espera laborable' do
    dia_de_mes = DiaEnMesFeriado.new('25/12')
    dia_a_consultar = '02/02/2017'
    expect(dia_de_mes.verificar_feriado(dia_a_consultar)).to eq true

  end

  it 'Se establece dia de mes feriado 25/12 espera no laborable' do
    dia_de_mes = DiaEnMesFeriado.new('25/12')
    dia_a_consultar = '25/12/2027'
    expect(dia_de_mes.verificar_feriado(dia_a_consultar)).to eq false

  end

  it 'Se establece dia de mes feriado 25/12 probando otro anio espera no laborable' do
    dia_de_mes = DiaEnMesFeriado.new('25/12')
    dia_a_consultar = '25/12/2000'
    expect(dia_de_mes.verificar_feriado(dia_a_consultar)).to eq false

  end

end
