module Stars
  class Favstar
    include HTTParty
    base_uri 'favstar.fm'
    format :xml
    attr_accessor :username
  
    def initialize(username)
      @username = username
    end

    def recent
      self.class.get("/users/#{@username}/rss")['rss']['channel']['item']
    end
  end
end