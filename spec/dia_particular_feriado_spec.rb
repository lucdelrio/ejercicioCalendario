require 'rspec'
require 'spec_helper'
require_relative '../model/feriado'
require_relative '../model/dia_particular_feriado'

describe 'Dia particular Feriado' do

  it 'Se establece dia particular feriado espera laborable' do
    dia_particular_feriado = DiaParticularFeriado.new('05/02/2017')
    dia_a_consultar = '28/02/2017'
    expect(dia_particular_feriado.verificar_feriado(dia_a_consultar)).to eq true

  end

  it 'Se establece dia particular feriado espera no laborable' do
    dia_particular_feriado = DiaParticularFeriado.new('05/02/2017')
    dia_a_consultar = '05/02/2017'
    expect(dia_particular_feriado.verificar_feriado(dia_a_consultar)).to eq false

  end
end
