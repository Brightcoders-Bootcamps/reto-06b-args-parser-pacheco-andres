register_flag = ARGV[0]
port_flag = ARGV[1]
port = ARGV[2]
directory_flag = ARGV[3]
path = ARGV[4]

class ArgsParser 
  attr_accessor :register_flag, :port_flag, :port, :directory_flag, :path

  def initialize(register_flag, port_flag, port, directory_flag, path)
    @register_flag = register_flag
    @port_flag = port_flag
    @port = port
    @directory_flag = directory_flag
    @path = path
    @error_message = 'ok'
  end

  def arguments_validation
    register_flag_exist? && port_flag_exist? && port_exist? && directory_flag_exist? && path_exist?
  end

  def register_flag_exist?
    if register_flag == '-l'
      true
    else
      @error_message = 'Falta agregar valor a register_flag'
      false
    end
  end

  def port_flag_exist?
    if port_flag == '-p'
      true
    else
      @error_message = 'Falta agregar valor a port_flag'
      false
    end
  end

  def port_exist?
    if port == '8080'
      true
    else
      @error_message = 'Falta agregar valor a port'
      false
    end 
  end

  def directory_flag_exist?
    if directory_flag == '-d'
      true
    else
      @error_message = 'Falta agregar valor a directory_flag'
      false
    end
  end

  def path_exist?
    if path != nil
      true
    else
      @error_message = 'Falta agregar valor a path'
      false
    end
  end

  def message_error
    @error_message
  end
end


a = ArgsParser.new(register_flag, port_flag, port, directory_flag, path)
a.arguments_validation
puts a.message_error



