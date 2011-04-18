module Stars
  class Post
    attr_reader :url
    attr_reader :service
    attr_reader :stars_count
    attr_reader :date

    attr_writer :name
    attr_writer :service
    attr_writer :url
    attr_writer :stars
    attr_writer :stars_count
    attr_writer :date

    def initialize(attributes)
      @name        = attributes[:name]
      @url         = attributes[:url]
      @stars       = attributes[:stars]
      @stars_count = attributes[:stars_count]
      @service     = attributes[:service]
      @date        = attributes[:date]
    end

    # The String name of the Post.
    #
    # This returns the String of the content of the Post (which we just call 
    # "name"). We also strip whitespace, since it tends to screw up things on
    # the command line.
    def name
      @name.gsub("\n",' ')
    end

    # The shorted String version of `name`.
    #
    # Returns a String of the name truncated at 35 characters.
    def short_name
      name.size > 35 ? "#{name[0..35]}..." : name
    end

    def stars
      @stars
    end

    def more
      service.constantize.more(self)
    end

    # Filter an Array of Post objects.
    #
    #   posts - an Array of Post objects to filter
    #
    # This returns the Array sorted by the 15 most recent stars.
    def self.filter(posts)
      posts.sort{ |a,b| b.date <=> a.date }[0..14]
    end
  end
end
