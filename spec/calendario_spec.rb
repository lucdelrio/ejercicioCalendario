require 'rspec'
require 'spec_helper'
require 'date'
require_relative '../model/calendario'
require_relative '../model/feriado'
require_relative '../model/dia_semana_feriado'
require_relative '../model/dia_feriado'
require_relative '../model/dia_particular_feriado'
require_relative '../model/dia_semana_por_rango_feriado'
require_relative '../model/dia_por_rango_feriado'


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

  it 'Se establece dia semana feriado por un rango de validez' do
    calendario = Calendario.new
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2016', '30/03/2017', 'SATURDAY')
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    dia_a_consultar = '08/09/2016'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia semana feriado por un rango de validez espera no laborable' do
    calendario = Calendario.new
    dia_semana_por_rango_feriado = DiaSemanaPorRangoFeriado.new('01/01/2016', '30/03/2017', 'Monday')
    calendario.agregar_feriado (dia_semana_por_rango_feriado)
    dia_a_consultar = '17/10/2016'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia feriado por un rango de validez' do
    calendario = Calendario.new
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    calendario.agregar_feriado (dia_por_rango_feriado)
    dia_a_consultar = '15/10/2010'
    laborable = true
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable

  end

  it 'Se establece dia feriado por un rango de validez espera no laborable' do
    calendario = Calendario.new
    feriado = '4/4'
    inicio = '1/1/2000'
    fin = '1/1/2013'
    dia_por_rango_feriado = DiaPorRangoFeriado.new(inicio, fin, feriado)
    calendario.agregar_feriado (dia_por_rango_feriado)
    dia_a_consultar = '4/4/2004'
    laborable = false
    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq laborable
  end

  it 'Se integran feriados y se pregunta por un dia laborable' do
    calendario = Calendario.new

    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_de_mes = DiaFeriado.new('25/12')
    primero_de_anio = DiaFeriado.new('01/01')
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
    dia_de_mes = DiaFeriado.new('25/12')

    calendario.agregar_feriado (dia_semana)
    calendario.agregar_feriado (dia_de_mes)

    laborable = false
    dia_a_consultar = '25/12/2014'

    expect(calendario.consultar_dia_laborable(dia_a_consultar)).to eq false
  end

  it 'Se integran feriados y se pregunta por 5/7 NO laborable' do

    calendario = Calendario.new

    dia_semana = DiaSemanaFeriado.new('Sunday')
    dia_de_mes = DiaFeriado.new('25/12')
    primero_de_anio = DiaFeriado.new('01/01')
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
