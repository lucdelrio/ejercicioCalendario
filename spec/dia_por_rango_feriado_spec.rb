require 'rspec'
require 'spec_helper'
require_relative '../model/feriado'
require_relative '../model/dia_por_rango_feriado'

describe 'Dia en un mes Feriado por un rango de tiempo' do

  it 'Se establece dia feriado por un rango de validez espera laborable' do
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    dia_a_consultar = '15/10/2010'
    laborable = nil
    expect(dia_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

  it 'Se establece dia feriado por un rango de validez espera laborable con fecha fuera de rango' do
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    dia_a_consultar = '4/4/2024'
    laborable = nil
    expect(dia_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

  it 'Se establece dia feriado por un rango de validez espera no laborable' do
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    dia_a_consultar = '4/4/2004'
    laborable = false
    expect(dia_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

  it 'Se establece dia feriado por un rango de validez espera no laborable probando con otro anio' do
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    dia_a_consultar = '4/4/2008'
    laborable = false
    expect(dia_por_rango_feriado.verificar_feriado(dia_a_consultar)).to eq laborable
  end

end
