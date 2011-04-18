# encoding: utf-8

# Client is our interface between user and terminal prompt. This does all of
# the heavy-lifting for formatting.
#
module Stars
  class Client
    
    attr_reader :posts
    attr_writer :posts
    
    # Initializes a new Client.
    #
    # Returns nothing.
    def initialize(cmd)
      Stars.config.prompt_for_username(cmd[1]) if cmd[0] == 'add'

      system "clear"
      puts "★  stars"

      display(cmd[0])
      star_loop
    end

    # Run a loop FOREVER until we kill it or we make a selection.
    #
    # Returns nothing.
    def star_loop
      selection = ''
      while true
        puts "Type the number of the post that you want to learn about"
        print "  (or hit return to view all again, you ego-maniac)   >> "
        selection = $stdin.gets.chomp
        break if ['','q','quit','exit','fuckthis'].include?(selection.downcase)
        show(selection)
      end
      display if selection == ''
    end

    # Displays all of the star tables and information we have.
    #
    # Returns nothing.
    def display(service=nil)
      Stars.config.prompt_for_service if Stars.installed_services.empty?

      if service && service != 'add'
        posts = service.constantize.posts
      else
        posts = Stars.installed_services.collect{ |service| 
                                  service.constantize.posts }.flatten
      end
      @posts = Post.filter(posts)
      puts print_posts(@posts)
    end

    # Show more information about a particular post.
    #
    # id - the Integer id entered by the user, which we map to a Post
    #
    # Returns nothing (although does delegate to the Post to show #more).
    def show(id)
      post = @posts[id.to_i-1]
      return puts("\nMake a valid selection. Pretty please?\n") unless post
      puts post.more
      display
    end

    # This does the actual printing of posts.
    #
    # posts - an Array of Post objects
    #
    # It loops through the Array of posts and sends them to `terminal-table`.
    def print_posts(posts)
      table do |t|
        t.headings = headings
        posts.each_with_index do |post,i|
          t << [
                { :value => i+1, :alignment => :right },
                post.service.capitalize,
                { :value => post.stars_count, :alignment => :center },
                post.short_name
               ]
        end
      end      
    end

    # The headings used in the resulting printed table.
    #
    # This returns an Array of headings.
    def headings
      [ 
        '',
        'Service',
        'Stars',
        {:value => 'The Hotness', :alignment => :center } 
      ]
    end

  end
end
