# Originally taken from Thoughtbot Bourbon (MIT -https://github.com/thoughtbot/bourbon/blob/master/LICENSE.md)
# https://github.com/thoughtbot/bourbon/blob/master/spec/support/matchers/have_ruleset.rb

RSpec::Matchers.define :have_ruleset do |expected|
  match do |selector|
    @ruleset = rules_from_selector(selector)
    @ruleset.join("; ") == expected
  end

  failure_message do |selector|
    if @ruleset.empty?
      %{no CSS for selector #{selector} were found}
    else
      ruleset = @ruleset.join("; ")
      %{Expected selector #{selector} to have CSS rule "#{expected}".
        Had "#{ruleset}".}
    end
  end

  def rules_from_selector(selector)
    ParserSupport.parser.find_by_selector(selector)
  end
end
