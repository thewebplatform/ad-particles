require "ad_particles/version"
require "fileutils"
require "thor"
require "pathname"

module AtomicDesignParticles
  class Generator < Thor
    map ["-v", "--version"] => :version

    desc "install", "Install Atomic Particles into your project"
    method_options :path => :string, :force => :boolean
    def install
      if atomic_files_already_exist? && !options[:force]
        puts "Atomic Particles files are already installed. You are good to go!"
      else
        install_files
        puts "Atomic Particles files installed to #{install_path}/"
      end
    end

    desc "update", "Update Atomic Particles"
    method_options :path => :string
    def update
      if atomic_files_already_exist?
        remove_atomic_directory
        install_files
        puts "Atomic Particles files have been updated."
      else
        puts "No existing Atomic Particles installation exists."
      end
    end

    desc "version", "Show Atomic Particles version"
    def version
      say "Atomic Design Particles #{AtomicDesignParticles::VERSION}"
    end

    private

    def atomic_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], "particles"))
        else
          Pathname.new("particles")
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def remove_atomic_directory
      FileUtils.rm_rf("particles")
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "atomic")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
