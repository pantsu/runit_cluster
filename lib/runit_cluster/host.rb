require "faraday-stack"
module  RunitCluster
  class Host
    COMMANDS = %w(up down restart switch_up switch_down)
    attr_accessor :connection

    def initialize(hash)
      @connection = FaradayStack.build("http://#{hash['addr']}:#{hash['port']}")
      if hash.keys.include? "login"
        @connection.headers['Authorization'] = "Basic #{Base64.encode64([hash['login'], hash['pass']].join(':')).chomp}"
      end
    end

    def services
      @connection.get "/services.json"
    end

    def manage(service, action)
      @connection.post("/#{service}/#{action}")
    end

    def method_missing(method, *args, &block)
      if COMMANDS.include?(method)
        define_method(method) do
          manage(args[0], method)
        end
      else
        super
      end
    end
  end
end
