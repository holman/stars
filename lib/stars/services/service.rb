module Stars
  class Service
    # Each Service is a party.
    include HTTParty

    # Returns a String name of the Service.
    #
    # We'll display this across Stars to identify this service.
    def name ; end

    def username
      Stars.config.username(name)
    end

    # Returns an Array of Posts.
    #
    # This method — to be overriden by individual Service classes — returns an
    # Array of Post items. Items in each Post should be associated with
    # individual Star objects, so we can quickly iterate over a Post's Stars.
    def posts ; end

    def self.more(post) ; end

    # Initializes a instance and returns the Posts.
    #
    # Creates a new instance of the Service and returns an Array of Post
    # objects.
    def self.posts
      self.new.posts
    end
  end
end
