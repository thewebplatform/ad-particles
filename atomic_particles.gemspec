$:.push File.expand_path("../lib", __FILE__)
require "atomic_particles/version"

Gem::Specification.new do |s|
  s.add_development_dependency "css_parser", "~> 1.4.1"
  s.add_development_dependency "rake", "~> 11.1.2"
  s.add_development_dependency "rspec", "~> 3.4.0"
  s.add_development_dependency "scss_lint", "0.48.0"
  s.add_runtime_dependency "sass", "~> 3.4.22"
  s.add_runtime_dependency "thor", "~> 0.19.1"
  s.authors = [ "Erik Isaksen" ]
  s.description = <<-DESC
    atomic_particles is SASS Module that defines a base set of variables that can used as a
    standard in component styling & consistent theming. Particles, although not
    originally discussed by Atomic Design creator Brad Frost, are the abstract &
    configuration structures that shape the Atomic design structure from the ground
    up.
  DESC
  s.email = "nevraeka@gmail.com"
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files = `git ls-files`.split("\n")
  s.homepage = "https://thewebplatform.github.io/atomic_particles"
  s.license = "MIT"
  s.name = "atomic_particles"
  s.platform = Gem::Platform::RUBY
  s.require_paths = ["lib"]
  s.summary = "A SASS Module that defines a base set of variables"
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = AtomicParticles::VERSION
end
