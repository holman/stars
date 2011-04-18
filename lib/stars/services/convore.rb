module Stars
  class Convore < Service

    attr_reader :posts

    def name
      "convore"
    end

    def posts
      [Post.new(:name        => "Number of stars received",
                :stars_count => stars,
                :service     => name,
                :date        => DateTime.now,
                :url         => "https://convore.com/users/#{Stars.config.username('convore')}")]
    end

    def html
      Nokogiri::HTML(open("https://convore.com/users/#{username}"))
    end

    def stars
      html.css('.stars-received strong').first.content.to_i
    end

    def self.more(post)
return <<-CONVORE

Convore doesn't have a stars API yet. So we're just scraping your total stars 
for now. Kind of a bummer, isn't it? You should probably send @ericflo a tweet 
and complain about it. Tell him I didn't send you.

Anyway, you have #{post.stars_count} stars with Convore right now. Check it:
  #{post.url}

CONVORE
    end

  end
end
