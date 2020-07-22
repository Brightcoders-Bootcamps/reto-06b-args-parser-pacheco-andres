register_flag = ARGV[0]
port_flag = ARGV[1]
port = ARGV[2]
directory_flag = ARGV[3]
path = ARGV[4]

class ArgsParser 
  def initialize(register_flag, port_flag, port, directory_flag, path)
    @register_flag = register_flag
    @port_flag = port_flag
    @port = port
    @directory_flag = directory_flag
    @path = path
  end

  def valid_ok
    if @register_flag == '-l' && @port_flag == '-p' && @port == 8080 && @directory_flag == '-d' && @path == '/usr/ading'
      'Todo ok!'
    else
      'Algo a salido mal, asegurese de mandar valores correctos'
      end
  end

  def port
    if @port == nil
      'Devera ingreasar un valor en port'
    end
  end

  def path
    if @path == nil
      'Devera ingresar un path'
    end
  end
end


a = Prueba.new('-l', '-p', 8080, '-d', '/usr/ading')
puts a.valid_ok




