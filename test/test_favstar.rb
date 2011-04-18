require 'helper'

class TestFavstar < Test::Unit::TestCase

  def setup
    global_setup
    @favstar = Stars::Favstar.new
  end

  def test_parse_title
    title = "6 stars: Zach Holman is attractive and handsome."
    parsed_title = @favstar.parse_title(title)
    assert_equal "Zach Holman is attractive and handsome.", parsed_title
  end

  def test_parse_title_with_colons
    title = "6 stars: Zach Holman is: attractive and handsome."
    parsed_title = @favstar.parse_title(title)
    assert_equal "Zach Holman is: attractive and handsome.", parsed_title
  end

  def test_parse_stars
    title = "6 stars: Zach Holman is attractive and handsome."
    parsed_stars = @favstar.parse_stars(title)
    assert_equal 6, parsed_stars
  end

end
