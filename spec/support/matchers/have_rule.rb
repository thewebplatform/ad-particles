# Originally taken from Thoughtbot Bourbon (MIT -https://github.com/thoughtbot/bourbon/blob/master/LICENSE.md)
# https://github.com/thoughtbot/bourbon/blob/master/spec/support/matchers/have_rule.rb

RSpec::Matchers.define :have_rule do |expected|
  match do |selector|
    @rules = rules_from_selector(selector)
    @rules.include? expected
  end

  failure_message do |selector|
    if @rules.empty?
      %{no CSS for selector #{selector} were found}
    else
      rules = @rules.join("; ")
      %{Expected selector #{selector} to have CSS rule "#{expected}".
        Had "#{rules}".}
    end
  end

  def rules_from_selector(selector)
    rulesets = ParserSupport.parser.find_by_selector(selector)
    if rulesets.empty?
      []
    else
      rules(rulesets)
    end
  end

  def rules(rulesets)
    rules = []
    rulesets.map do |ruleset|
      ruleset.split(";").each do |rule|
        rules << rule.strip
      end
    end
    rules
  end
end
