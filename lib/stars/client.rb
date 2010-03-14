module Stars
  class Client
  
    def self.load!
      favstar = Stars::Favstar.new(username)
      puts Stars::Formatter.new(favstar.recent)
    end
  
    def self.username
      File.exists?(config_path) ? File.read(config_path) : prompt_for_username
    end
  
    def self.prompt_for_username
      puts ""
      puts ""
      puts " ★   stars."
      puts ""
      puts "Type your Twitter username:"
      remember_username(gets.chomp)
    end
  
    def self.remember_username(username)
      File.open(config_path, 'w') {|f| f.write(username) }
      username
    end
  
    def self.config_path
      File.join(ENV['HOME'], '.stars')
    end
  
  end
end