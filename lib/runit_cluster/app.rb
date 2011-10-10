require 'yajl'
require 'haml'
require 'i18n'
require 'sinatra/base'
require 'runit_cluster/version'

if RUBY_VERSION >= '1.9'
  Encoding.default_external = "utf-8"
  Encoding.default_internal = "utf-8"
end

class RunitCluster::Application < Sinatra::Base

  CONTENT_TYPES = {
    :html => 'text/html',
    :txt  => 'text/plain',
    :css  => 'text/css',
    :js   => 'application/x-javascript',
    :json => 'application/json'
  }.freeze

  get '/' do
    haml :index
  end

end
