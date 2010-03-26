require 'helper'

class TestFavstar < Test::Unit::TestCase

  def setup
    @favstar = Stars::Favstar.new
  end
  
  def test_parties_hard
    mock(Stars::Favstar).get('/users/holman/rss', :format => :xml) { 
      {'rss' => {'channel' => {'item' => 'etc'} } }
    }
    @favstar.recent('holman')
  end

end