# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "runit_cluster/version"

Gem::Specification.new do |s|
  s.name        = "runit_cluster"
  s.version     = RunitCluster::VERSION
  s.authors     = ["Maxim Filatov", "Nick Kugaevsky", "Valentin Eremin"]
  s.email       = ["pipopolam@gmail.com", "nick@kugaevsky.ru", "valentin.a.eremin@gmail.com"]
  s.homepage    = "https://github.com/pantsu/runit_cluster"
  s.summary     = %q{Multiple runit-man management tool}
  s.description = %q{Sinatra-based web interface for management multiple installations of runit-man}

  s.rubyforge_project = "runit_cluster"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency 'sinatra'
  s.add_dependency 'sinatra-config-file'
  s.add_dependency 'yajl-ruby'
  s.add_dependency 'haml'
  s.add_dependency 'i18n'
  s.add_dependency 'faraday-stack'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'nokogiri'

end
