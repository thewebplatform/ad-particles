require "spec_helper"

describe "box" do
  before(:all) do
    ParserSupport.parse_file("mixins/box")
  end

  context "box__border" do

    it "should not render a border-radius rule if $radius equals 0" do
      expect(".box__border--rounded-custom").to have_rule "border-radius: 10px"
    end

    it "should render a border-radius rule when $radius is not 0" do
      expect(".box__border").to_not have_rule "border-radius: 3px"
      expect(".box__border").to_not have_rule "border-radius: 0"
    end

    it "should render the default border color when $color is not explicitly set" do
      expect(".box__border--default").to have_rule "border: 1px solid #999999"
    end

    it "should render the color border specified when $color is explicitly set" do
      expect(".box__border--custom").to have_rule "border: 1px solid #ff0000"
    end

    it "should render the color border specified when $color is explicitly set" do
      expect(".box__border--custom-with-radius").to have_ruleset("border: 1px solid #ff0000; border-radius: 4px;")
    end

  end

  context "box__border_rounded" do

    it "should render a border-radius rule with the global border-radius value" do
      expect(".box__border--rounded").to have_rule "border-radius: 3px"
    end

    it "should render a given border-radius rule when called with a specific value" do
      expect(".box__border--rounded-custom").to have_rule "border-radius: 10px"
    end

  end

end
