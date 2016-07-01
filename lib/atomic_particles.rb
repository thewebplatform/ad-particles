require "atomic_particles/generator"

atomic_path = File.expand_path("../../atomic", __FILE__)

ENV["SASS_PATH"] = [
  ENV["SASS_PATH"],
  atomic_path,
].compact.join(File::PATH_SEPARATOR)
