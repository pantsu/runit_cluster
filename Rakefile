require "bundler/gem_tasks"
require 'rspec/core/rake_task'

$LOAD_PATH.unshift('./lib')
require 'runit_cluster/version'

RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = ["-c", "-f progress"]
end

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.rcov = true
  t.ruby_opts = '-w'
  t.rspec_opts = ["-c", "-f progress"]
  t.rcov_opts = %q[-Ilib --exclude "spec/*,gems/*"]
end
