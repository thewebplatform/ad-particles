require "spec_helper"

describe "box" do
  before(:all) do
    ParserSupport.parse_file("mixins/color")
  end

  context "color-gray--fade" do

    it "should provide cross browser vendor prefixed linear-gradients with a solid color fallback" do
      fallback = "background: #555555"
      standard = fallback + "; background-image: linear-gradient(top, transparent 0%, rgba(184, 184, 184, 0) 90%, rgba(204, 204, 204, 0.65) 100%);"

      expect(".color_gray--gradient").to have_rule fallback
      expect(".color_gray--gradient").to have_ruleset standard
    end

  end

end
