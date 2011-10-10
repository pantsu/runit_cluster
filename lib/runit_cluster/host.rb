require "faraday-stack"
module  RunitCluster
  class Host
    COMMANDS = %w(up down restart switch_up switch_down)
    attr_accessor :connection
    attr_reader :errors

    def initialize(hash)
      @errors = []
      hash = hash.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      @connection = FaradayStack.build("http://#{hash[:addr]}:#{hash[:port]}")
      if hash.keys.include? :login
        @connection.basic_auth(hash[:login], hash[:pass])
      end
    end

    def services
      @connection.get("/services.json").body
    rescue Faraday::Error::ClientError => error
      @errors << error.message
      return []
    end

    def manage(service, action)
      @connection.post("/#{service}/#{action}")
    end

    def method_missing(method, *args, &block)
      if COMMANDS.include?(method.to_s)
        manage(args[0], method.to_s)
      else
        super
      end
    end
  end
end
