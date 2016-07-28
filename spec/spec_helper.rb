
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require "rspec"
require "ad_particles"
require "css_parser"
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include SassSupport
  config.include CssParser
  config.include ParserSupport
  config.color = true
  config.tty = true
  config.formatter = :documentation # :progress, :html, :textmate

  config.before(:all) do
    generate_css
  end

  config.after(:all) do
    # clean_up
  end
end
