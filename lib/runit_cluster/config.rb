module RunitCluster
  class Config
    class << self

      # Defines default configuration parameters (localhost is default)
      #
      # @return [Hash]
      def defaults
        @defaults ||= {
          name: `hostname`.chomp,
          addr: "127.0.0.1",
          port: "5678",
          login: "admin",
          pass: "admin"
        }
        end
      # Add parameters to configuration
      #
      # @return [Hash]
      def use
        @configuration ||= {}
        yield @configuration
      end

      # Collect configuration parameters. If parameter does not exist, defaults will be used.
      #
      # @param [Hash]
      # @return [Hash]
      def setup(settings = {})
        @configuration = defaults.merge(settings)
      end

      # Check for parameter's existance
      #
      # @param [key]
      # @return [Boolean]
      def key?(key)
        @configuration.key?(key)
      end

      # Get the value of the element of configuration Hash
      #
      # @param [key, value]
      # @return [String]
      def [](key)
        (@configuration ||= setup)[key]
      end

      # Set the value of the element of configuration Hash
      # @param [key, value]
      # @return [String]
      def []=(key, value)
        (@configuration ||= setup)[key] = value
      end
    end
  end
end
