require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :default => :spec


desc "Run the tests."
RSpec::Core::RakeTask.new do |t|
  t.pattern = Dir.glob('spec/*_spec.rb')
  t.rspec_opts = '--format documentation'
  t.verbose = false
end
