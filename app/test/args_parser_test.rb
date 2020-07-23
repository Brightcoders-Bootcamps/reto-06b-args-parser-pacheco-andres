# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../args_parser.rb'
require_relative '../string.rb'

# frame logic class test
class ArgsParserTest < Minitest::Test
  def test_arguments_validation
    params_array =  ["-l", "-p", "8080", "-d", "/usr/test"]
    result = ArgsParser.new(params_array)

    assert_equal result.arguments_validation, true
  end

  def test_missing_value_register_flag
    params_array = ["-p", "8080", "-d", "/usr/test"]
    result = ArgsParser.new(params_array)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a register_flag'
  end

  def test_missing_value_port_flag
    params_array =  ["-l", "8080", "-d", "/usr/test"]
    result = ArgsParser.new(params_array)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a port_flag'
  end

  def test_missing_value_port
    params_array =  ["-l", "-p", "-d", "/usr/test"]
    result = ArgsParser.new(params_array)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a port'
  end

  def test_missing_value_directory_flag
    params_array =  ["-l", "-p", "8080", "/usr/test"]
    result = ArgsParser.new(params_array)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a directory_flag'
  end

  def test_missing_value_path
    params_array =  ["-l", "-p", "8080", "-d"]
    result = ArgsParser.new(params_array)
    result.arguments_validation
    assert_equal result.message_error, 'Falta agregar valor a path'
  end
end
