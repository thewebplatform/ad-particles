require "spec_helper"

describe "box" do
  before(:all) do
    ParserSupport.parse_file("mixins/box")
  end

  context "box-border" do

    it "should not render a border-radius rule if $radius equals 0" do
      expect(".box_border--rounded-custom").to have_rule "border-radius: 10px"
    end

    it "should render a border-radius rule when $radius is not 0" do
      expect(".box_border").to_not have_rule "border-radius: 3px"
      expect(".box_border").to_not have_rule "border-radius: 0"
    end

    it "should render the default border color when $color is not explicitly set" do
      expect(".box_border--default").to have_rule "border: 1px solid #999999"
    end

    it "should render the color border specified when $color is explicitly set" do
      expect(".box_border--custom").to have_rule "border: 1px solid #ff0000"
    end

    it "should render the color border specified when $color is explicitly set" do
      expect(".box_border--custom-with-radius").to have_ruleset("border: 1px solid #ff0000; border-radius: 4px;")
    end

  end

  context "box-border--primary" do

    it "should render a border rule with the $color-brand--primary value" do
      expect(".box_border--brand-primary").to have_rule("border: 1px solid #007fb2")
    end

  end

  context "box-border--secondary" do

    it "should render a border rule with the $color-brand--secondary value" do
      expect(".box_border--brand-secondary").to have_rule("border: 1px solid #e6b319")
    end

  end

  context "box-border-rounded" do

    it "should render a border-radius rule with the global border-radius value" do
      expect(".box_border--rounded").to have_rule "border-radius: 3px"
    end

    it "should render a given border-radius rule when called with a specific value" do
      expect(".box_border--rounded-custom").to have_rule "border-radius: 10px"
    end

  end

end
