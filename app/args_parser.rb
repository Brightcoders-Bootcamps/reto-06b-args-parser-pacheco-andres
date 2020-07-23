# frozen_string_literal: true

require_relative 'string.rb'
params_array = ARGV

# logic class args parser
class ArgsParser
  attr_reader :params_array

  def initialize(params_array)
    @params_array = params_array
    @error_message = 'ok'
  end

  def arguments_validation
    register_flag_exist? && port_flag_exist? && port_exist? && directory_flag_exist? && path_exist?
  end

  def register_flag_exist?
    register_flag = params_array[0]
    @error_message = 'Falta agregar valor a register_flag' if register_flag != '-l'
    register_flag == '-l'
  end

  def port_flag_exist?
    port_flag = params_array[1]
    @error_message = 'Falta agregar valor a port_flag' if port_flag != '-p'
    port_flag == '-p'
  end

  def port_exist?
    port = params_array[2]
    @error_message = 'Falta agregar valor a port' if port != '8080'
    port == '8080'
  end

  def directory_flag_exist?
    directory_flag = params_array[3]
    @error_message = 'Falta agregar valor a directory_flag' if directory_flag != '-d'
    directory_flag == '-d'
  end

  def path_exist?
    path = params_array[4]
    path_present = StringUtility.present?(path)
    @error_message = 'Falta agregar valor a path' unless path_present
    path_present
  end

  def message_error
    @error_message
  end
end

result = ArgsParser.new(params_array)
result.arguments_validation
puts result.message_error
