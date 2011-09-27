module RunitCluster
  class Config
    class << self
      def defaults
        @defaults ||= {
          name: `hostname`.chomp,
          addr: "127.0.0.1",
          port: "5678",
          login: "admin",
          pass: "admin"
        }
        end
      def use
        @configuration ||= {}
        yield @configuration
      end
      def setup(settings = {})
        @configuration = defaults.merge(settings)
      end
      def key?(key)
        @configuration.key?(key)
      end
      def [](key)
        (@configuration ||= setup)[key]
      end
      def []=(key, value)
        (@configuration ||= setup)[key] = value
      end
    end
  end
end
