require 'ffi-swig-generator'
# load 'lib/generator/generatortask.rb'

require "bundler/gem_tasks"
require "rspec/core/rake_task"

FFI::Generator::Task.new do |task|
  task.input_fn = 'interface/*.i'
  task.output_dir = 'out'
end

RSpec::Core::RakeTask.new

task default: :spec
