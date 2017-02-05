require 'rspec'
require 'spec_helper'
require 'date'
require_relative '../model/calendario'
require_relative '../model/feriado'
require_relative '../model/dia_semana_feriado'
require_relative '../model/dia_feriado'
require_relative '../model/dia_particular_feriado'
require_relative '../model/dia_semana_por_rango_feriado'

describe 'Calendario' do

  it 'Sin feriados establecidos espera Dia Laborable' do
    calendario = Calendario.new
    dia_a_consultar = '25/12/2012'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

    #expect{asteroide.choques_posibles[Nave] = EfectoMasa.new (0)}.to raise_exception(ExcepcionPorcentajeCero)
  end

  it 'Se establece feriado Sunday' do
    calendario = Calendario.new
    dia_semana = DiaSemanaFeriado.new('Sunday')
    calendario.agregar_feriado (dia_semana)
    dia_a_consultar = '29/01/2017'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece feriado Friday espera no laborable' do
    calendario = Calendario.new
    dia_semana = DiaSemanaFeriado.new('Friday')
    calendario.agregar_feriado (dia_semana)
    dia_a_consultar = '03/02/2017'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece feriado Friday pregunta por Jueves' do
    calendario = Calendario.new
    dia_semana = DiaSemanaFeriado.new('Friday')
    calendario.agregar_feriado (dia_semana)
    dia_a_consultar = '02/02/2017'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia de mes feriado' do
    calendario = Calendario.new
    dia_de_mes = DiaFeriado.new('25/12')
    calendario.agregar_feriado (dia_de_mes)
    dia_a_consultar = '02/02/2017'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia de mes feriado espera no laborable' do
    calendario = Calendario.new
    dia_de_mes = DiaFeriado.new('25/12')
    calendario.agregar_feriado (dia_de_mes)
    dia_a_consultar = '25/12/2027'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia particular feriado' do
    calendario = Calendario.new
    dia_particular_feriado = DiaParticularFeriado.new('05/02/2017')
    calendario.agregar_feriado (dia_particular_feriado)
    dia_a_consultar = '28/02/2017'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia particular feriado espera no laborable' do
    calendario = Calendario.new
    dia_particular_feriado = DiaParticularFeriado.new('05/02/2017')
    calendario.agregar_feriado (dia_particular_feriado)
    dia_a_consultar = '05/02/2017'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia feriado por un rango de validez espera no laborable' do
    calendario = Calendario.new
    dia = 'Sunday'
    inicio = '01/01/2016'
    fin = '30/03/2017'
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new(inicio, fin, dia)
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    dia_a_consultar = '19/02/2017'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia feriado por un rango de validez' do
    calendario = Calendario.new
    dia = 'Sunday'
    inicio = '01/01/2016'
    fin = '30/03/2017'
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new(inicio, fin, dia)
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    dia_a_consultar = '10/02/2017'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

end
