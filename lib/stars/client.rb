module Stars
  class Client

    def self.load!(new_username=nil)
      remember_username(new_username) if new_username
      @recent = Stars::Favstar.new.recent(username)
      display
    end
    
    def self.display
      system 'clear'
      puts "\n  ★ by @#{username}"
      puts Stars::Formatter.new(@recent)
      select_star
    end
  
    def self.username
      File.exists?(config_path) ? File.read(config_path) : prompt_for_username
    end
  
    def self.prompt_for_username
      puts ""
      puts ""
      puts "  ★* stars"
      puts ""
      puts "Type your Twitter username:"
      remember_username(STDIN.gets.chomp)
    end
  
    def self.remember_username(username)
      File.open(config_path, 'w') {|f| f.write(username) }
      username
    end
  
    def self.config_path
      File.join(ENV['HOME'], '.stars')
    end
    
    def self.select_star
      selection = ''
      while true
        puts "Type the number of the toot that you want to learn about"
        puts "  (or hit return to view all again, you ego-maniac)   >>"
        selection = STDIN.gets.chomp
        break if ['','q','quit','exit','fuckthis'].include?(selection.downcase)
        show_selection(selection)
      end
      display if selection == ''
    end
    
    def self.show_selection(id)
      puts ''
      puts wrap_text('  ' + @recent[id.to_i - 1]['title'], 60)
      puts parse_who(@recent[id.to_i - 1]['guid'])
      puts ''
    end
    
    def self.parse_who(url)
      Stars::Favstar.new.show(url)
    end
    
    def self.wrap_text(txt, col = 80)
      txt.gsub(/(.{1,#{col}})( +|$\n?)|(.{1,#{col}})/,
        "\\1\\3\n    ") 
    end
  
  end
end
