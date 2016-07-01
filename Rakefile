
require "bundler"
require "rspec/core/rake_task"
require "scss_lint/rake_task"

SCSSLint::RakeTask.new(:scss_lint) do |t|
  t.config = ".scss-lint.yml"
  t.files = [
    "atomic/particles"
  ]
end
Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)

task :default => [:spec, :scss_lint]
