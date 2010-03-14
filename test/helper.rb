require 'rubygems'
require 'test/unit'
require 'redgreen'
require 'rr'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'stars'

class Test::Unit::TestCase
  
  include RR::Adapters::TestUnit
  
  def favstar_tweet_hash
    [
      {
       "title"=>"2 stars: I pre-ordered an iPad, checked into lunch, and now you want me to follow someone just because it's Friday? I CAN'T KEEP UP WITH YOU GUYS", 
       "pubDate"=>"Fri, 12 Mar 2010 20:43:40 +0000", 
       "guid"=>"http://favstar.fm/users/holman/status/10389110831?2", 
       "description"=>"Has been faved by 2 people<br /><br /><a href=\"http://favstar.fm/users/holman/status/10389110831\">This tweet</a>
       &nbsp;&nbsp;&nbsp;<a href=\"http://favstar.fm/users/holman/recent\">All Recent</a>", 
       "link"=>"http://favstar.fm/users/holman/status/10389110831"
      }, 
      {
       "title"=>"1 star: In another life I want to be a pop star heartthrob who also codes Perl in his free time. That'll confuse those impressionable teen fangirls.", 
       "pubDate"=>"Fri, 12 Mar 2010 20:13:46 +0000", 
       "guid"=>"http://favstar.fm/users/holman/status/10387998839?1", 
       "description"=>"Has been faved by 1 person<br /><br /><a href=\"http://favstar.fm/users/holman/status/10387998839\">This tweet</a>
       &nbsp;&nbsp;&nbsp;<a href=\"http://favstar.fm/users/holman/recent\">All Recent</a>", 
       "link"=>"http://favstar.fm/users/holman/status/10387998839"
       }
    ]
  end
  
end