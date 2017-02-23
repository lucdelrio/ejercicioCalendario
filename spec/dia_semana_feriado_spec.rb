require 'rspec'
require 'spec_helper'
require_relative '../model/feriado'
require_relative '../model/dia_semana_feriado'

describe 'Dia de la semana Feriado' do

  it 'Se establece feriado Domingo espera no laborable' do
    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_a_consultar = '29/01/2017'
    expect(dia_semana.verificar_feriado(dia_a_consultar)).to eq false

  end

  it 'Se establece feriado Viernes espera no laborable' do
    dia_semana = DiaSemanaFeriado.new('Friday')
    dia_a_consultar = '03/02/2017'
    expect(dia_semana.verificar_feriado(dia_a_consultar)).to eq false

  end

  it 'Se establece feriado Viernes pregunta por Jueves espera laborable' do
    dia_semana = DiaSemanaFeriado.new('Wednesday')
    dia_a_consultar = '02/02/2017'
    expect(dia_semana.verificar_feriado(dia_a_consultar)).to eq true

  end

end
