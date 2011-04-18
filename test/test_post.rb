require 'helper'

class TestPost < Test::Unit::TestCase

  def setup
    global_setup
    @post = Stars::Post.new(:name => 'post')
  end

  def test_short_name
    s = ""
    36.times { s << "x" }
    @post.name = s
    assert_equal true, @post.short_name.include?('...') 
  end

  def test_full_short_name
    s = ""
    10.times { s << "x" }
    @post.name = s
    assert_equal false, @post.short_name.include?('...') 
  end

  def test_moar
    @post.stubs(:service).returns("Favstar")
    Stars::Favstar.expects(:more).returns("favstar more")
    assert_equal "favstar more", @post.more
  end

end
