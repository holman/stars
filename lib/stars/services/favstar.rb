#{"title"=>"6 stars: Why can't we hardware-accelerate animated gifs? I thought this was the future.", "pubDate"=>"Wed, 16 Feb 2011 05:56:32 +0000", "guid"=>"http://favstar.fm/users/holman/status/37752168152825856?6", "description"=>"Has been faved by 6 people<br /><br /><a href=\"http://favstar.fm/users/holman/status/37752168152825856\">This tweet</a>&nbsp;&nbsp;&nbsp;<a href=\"http://favstar.fm/users/holman/recent\">All Recent</a>", "link"=>"http://favstar.fm/users/holman/status/37752168152825856"}

module Stars
  class Favstar < Service

    base_uri 'favstar.fm'

    attr_reader :posts

    def name
      "favstar"
    end

    def posts
      parse_xml
      @posts
    end

    def xml_feed
      self.class.get("/users/#{username}/rss",
                      :format => :xml)['rss']['channel']['item']
    end

    def parse_xml
      @posts = []

      xml_feed.each do |xml|
        @posts << parse_post(xml)
      end
    end

    def parse_post(xml)
      title = xml["title"]
      Post.new(:name        => parse_title(title),
               :url         => xml["guid"],
               :service     => name,
               :date        => DateTime.parse(xml["pubDate"]),
               :stars_count => parse_stars(title))
    end

    # Parse the title from a Favstar RSS title.
    #
    #   title - a Favstar-formatted String (x stars: title here)
    #
    # This splits on the first colon, and then use everything after that. To
    # account for tweets with colons in them, we have to strip the first ": "
    # String we find, and then shift the String back two characters.
    def parse_title(title)
      strip = title.split(':').first
      title = title.gsub(strip,'')
      title = title[2..-1] if title[0..1] == ": "
      title
    end

    def parse_stars(title)
      title.match(/[\d]+/)[0].to_i
    end

    def self.more(post)
      # hardcode 17 to strip favstar domain for now
      html = get(post.url[17..200], :format => :html)

      output = ''

      Nokogiri::HTML(html).css('div[id^="faved_by_others"] img').collect do |img|
        output << "    ★   #{img.attributes['alt'].value}\n"
      end

      Nokogiri::HTML(html).css('div[id^="rt_by_others"] img').collect do |img|
        output << "    RT  #{img.attributes['alt'].value}\n"
      end

      output << "\n"
      output << "More info at:\n"
      output << "  #{post.url}\n\n"
    end
    
  end
end
