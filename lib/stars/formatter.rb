require 'terminal-table/import'

module Stars
  class Formatter
    
    attr_accessor :tweets

    def initialize(tweets)
      @tweets = tweets
    end
  
    # I hate clients that don't retain line breaks, but in this case I'm boss.
    def trim(text)
      truncated = text.gsub("\n"," ")[0..50]
      truncated + (truncated.size == text.size ? '' : '...')
    end
  
    def format(i, tweet)
      stars,text = split_stars(tweet['title'])
      [i,stars,relative_time(tweet['pubDate']),text]
    end
  
    def split_stars(text)
      stars = text.match(/[\d+]./)[0].to_i
      strip_point = text.index(':') + 2
      text  = text[strip_point..text.size] 
      [characterize(stars),trim(text)]
    end
  
    def characterize(number)
      if number > 5
        "* x #{number}"
      else
        (1..number).collect{'*'}.join(' ')
      end
    end
  
    def line_break
      "\n"
    end
  
    def to_s
      tweets = @tweets.collect_with_index{|tweet,i| format(i+1,tweet)}
      table(['#','Stars','Time','Your Funnies'], *tweets).render
    end
  
    def relative_time(time)
      post_date = Time.parse(time)
      timespan = Time.now - Time.parse(time)

      case timespan
      when 0..59
        "just now"
      when 60..(3600-1)
        "#{pluralize((timespan/60).to_i, 'minute', 'minutes')} ago"
      when 3600..(3600*24-1)
        "#{pluralize((timespan/3600).to_i, 'hour', 'hours')} ago"
      when (3600*24)..(3600*24*30)
        "#{pluralize((timespan/(3600*24)).to_i, 'day', 'days')} ago"
      else
        post_date.strftime("%m/%d/%Y")
      end
    end
  
    # ActiveSupport pluralize
    def pluralize(count, singular, plural = nil)
      "#{count || 0} " + ((count == 1 || count == '1') ? singular : (plural || singular.pluralize))
    end
  end
end