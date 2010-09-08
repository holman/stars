require 'nokogiri'
module Stars
  class Favstar
    include HTTParty
    base_uri 'favstar.fm'
    proxy_url = URI.parse(ENV['http_proxy']) if ENV['http_proxy']
    http_proxy proxy_url.host,proxy_url.port if proxy_url

    def recent(username)
      self.class.get("/users/#{username}/rss",
                      :format => :xml)['rss']['channel']['item']
    end
    
    def show(url)
      # hardcode 17 to strip favstar domain for now
      html = self.class.get(url[17..200], :format => :html)
      Nokogiri::HTML(html).css('.avatarList img').collect do |img|
        "    *  #{img.attributes['alt'].value}"
      end
    end
  end
end
