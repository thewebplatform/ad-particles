require "fileutils"

module SassSupport
  def generate_css
    FileUtils.mkdir_p "tmp"
    `sass -I . --update spec/fixtures:tmp --quiet`
  end

  def clean_up
    FileUtils.rm_rf("tmp")
  end
end
