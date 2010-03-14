require 'helper'

class TestFavstar < Test::Unit::TestCase

  def setup
    @favstar = Stars::Favstar.new('holman')
  end

  def test_sets_username
    assert_equal @favstar.username, 'holman'
  end
  
  def test_parties_hard
    mock(Stars::Favstar).get('/users/holman/rss') { 
      {'rss' => {'channel' => {'item' => 'etc'} } }
    }
    @favstar.recent
  end

end