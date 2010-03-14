require 'helper'

class TestFormatter < Test::Unit::TestCase

  def setup
    @formatter = Stars::Formatter.new(favstar_tweet_hash)
  end

  def test_trim_breaks
    tweet = "Line breaks\nare for lovers"
    assert_equal @formatter.trim(tweet), 'Line breaks are for lovers'
  end
  
  def test_trim_length
    tweet = "This is a tweet that is long enough to certainly "+
            "need at least SOME truncating lol lol sigh."
    assert_equal @formatter.trim(tweet), 
                 'This is a tweet that is long enough to certainly ne...'
  end
  
  def test_format
    format = @formatter.format(favstar_tweet_hash[0])
    assert_equal format.size, 3
    assert_equal format[0], '* *'
  end

  def test_split_stars
    tweet = "12 stars: A short tweet. Hey, a number: 5."
    assert_equal @formatter.split_stars(tweet),
                 ['* x 12', 'A short tweet. Hey, a number: 5.']
  end
  
  def test_characterize_with_lots_of_stars
    assert_equal @formatter.characterize(12),
                 '* x 12'
  end
  
  def test_characterize_with_a_few_stars
    assert_equal @formatter.characterize(4),
                 '* * * *'
  end
  
  def test_line_break
    assert_equal @formatter.line_break, "\n"
  end
  
  def test_to_s
    # just make sure it doesn't blow up for now
    @formatter.to_s
  end
  
  def test_relative_time
    assert_equal @formatter.relative_time((Time.now - 2).to_s),
                 "just now"
    assert_equal @formatter.relative_time((Time.now - 360).to_s),
                 "6 minutes ago"
    assert_equal @formatter.relative_time((Time.now - 10000).to_s),
                 "2 hours ago"
  end
  
  def test_pluralizer
    assert_equal @formatter.pluralize(1, 'day', 'day'), '1 day'
    assert_equal @formatter.pluralize(2, 'day', 'days'), '2 days'
  end

end