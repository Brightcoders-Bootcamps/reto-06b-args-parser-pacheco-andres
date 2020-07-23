# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../args_parser.rb'

# frame logic class test
class ArgsParserTest < Minitest::Test
  def test_arguments_validation
    result = ArgsParser.new(register_flag = '-l', port_flag = '-p', port = '8080', directory_flag = '-d', path = '/usr/test')

    assert_equal result.arguments_validation, true
  end

  def test_missing_value_register_flag
    register_flag = '-l'
    port_flag = '-p'
    port = '8080'
    directory_flag = '-d'
    path = '/usr/test'
    result = ArgsParser.new(nil, port_flag, port, directory_flag, path)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a register_flag'
  end

  def test_missing_value_port_flag
    register_flag = '-l'
    port_flag = '-p'
    port = '8080'
    directory_flag = '-d'
    path = '/usr/test'
    result = ArgsParser.new(register_flag, nil, port, directory_flag, path)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a port_flag'
  end

  def test_missing_value_port
    register_flag = '-l'
    port_flag = '-p'
    port = '8080'
    directory_flag = '-d'
    path = '/usr/test'
    result = ArgsParser.new(register_flag, port_flag, nil, directory_flag, path)
    result.arguments_validation
    assert_equal result.message_error,'Falta agregar valor a port'
  end

  def test_missing_value_directory_flag
    register_flag = '-l'
    port_flag = '-p'
    port = '8080'
    directory_flag = '-d'
    path = '/usr/test'
    result = ArgsParser.new(register_flag, port_flag, port, nil, path)
    result.arguments_validation
    assert_equal result.message_error,'Falta agregar valor a directory_flag'
  end

  def test_missing_value_path
    register_flag = '-l'
    port_flag = '-p'
    port = '8080'
    directory_flag = '-d'
    path = '/usr/test'
    result = ArgsParser.new(register_flag, port_flag, port, directory_flag, nil)
    result.arguments_validation
    assert_equal result.message_error,'Falta agregar valor a path'
  end
end
