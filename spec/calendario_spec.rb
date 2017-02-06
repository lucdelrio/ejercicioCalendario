require 'rspec'
require 'spec_helper'
require 'date'
require_relative '../model/calendario'
require_relative '../model/feriado'
require_relative '../model/dia_en_mes_feriado'
require_relative '../model/dia_particular_feriado'
require_relative '../model/dia_por_rango_feriado'
require_relative '../model/dia_semana_feriado'
require_relative '../model/dia_semana_por_rango_feriado'


describe 'Calendario' do

  it 'Sin feriados establecidos espera Dia Laborable' do
    calendario = Calendario.new
    dia_a_consultar = '25/12/2012'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se integran feriados y espera dia laborable' do
    calendario = Calendario.new

    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_de_mes = DiaEnMesFeriado.new('25/12')
    primero_de_anio = DiaEnMesFeriado.new('01/01')
    dia_particular_feriado = DiaParticularFeriado.new('20/11/2011')
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2000', '30/03/2017', 'Monday')
    dia_por_rango_feriado = DiaPorRangoFeriado.new('1/1/2000', '1/1/2018', '5/7')

    calendario.agregar_feriado (dia_semana)
    calendario.agregar_feriado (dia_de_mes)
    calendario.agregar_feriado (primero_de_anio)
    calendario.agregar_feriado (dia_particular_feriado)
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    calendario.agregar_feriado (dia_por_rango_feriado)

    dia_a_consultar = '11/12/2012'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable
  end

  it 'Se integran feriados y se pregunta por 25/12 NO laborable' do

    calendario = Calendario.new

    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_de_mes = DiaEnMesFeriado.new('25/12')

    calendario.agregar_feriado (dia_semana)
    calendario.agregar_feriado (dia_de_mes)

    laborable = false
    dia_a_consultar = '25/12/2014'

    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq false
  end

  it 'Se integran feriados y se pregunta por 5/7 NO laborable' do

    calendario = Calendario.new

    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_de_mes = DiaEnMesFeriado.new('25/12')
    primero_de_anio = DiaEnMesFeriado.new('01/01')
    dia_particular_feriado = DiaParticularFeriado.new('20/11/2011')
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2000', '30/03/2017', 'TuesDay')
    dia_por_rango_feriado = DiaPorRangoFeriado.new('1/1/2000', '1/1/2018', '5/7')

    calendario.agregar_feriado (dia_semana)
    calendario.agregar_feriado (dia_de_mes)
    calendario.agregar_feriado (primero_de_anio)
    calendario.agregar_feriado (dia_particular_feriado)
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    calendario.agregar_feriado (dia_por_rango_feriado)

    dia_a_consultar = '05/07/2017'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

end
