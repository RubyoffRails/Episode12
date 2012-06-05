require "rubygems"
require "bundler/setup"

require 'rspec/core/rake_task'
require 'rake/testtask'

desc 'Default: run specs and tests'
task :default => [:spec, :test]

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

desc "Run Minitest and Test::Unit"
Rake::TestTask.new do |t|
  t.pattern = '**/*_test.rb'
end
