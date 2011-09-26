require File.join(File.dirname(__FILE__), '..', 'lib', 'runit_cluster', 'app')

require 'rack/test'
require 'rspec'

class RunitCluster
  # set test environment
  set :environment,  :test
  set :raise_errors, true
  set :logging,      false
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.include   Rack::Test::Methods
end
