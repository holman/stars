module Stars
  class Config

    attr_reader :keep

    attr_writer :keep
    
    def initialize
      @keep = Keep.new(config_path)
    end

    def config_path
      "#{File.expand_path('~')}/.stars.yml"
    end

    def username(service)
      prompt_for_username(service)
    end

    def prompt_for_service
      puts "What service do you want to track?"
      puts "Your options: #{Stars.uninstalled_services.join(', ')}"
      service = $stdin.gets.chomp.downcase
      prompt_for_username(service)
    end

    def prompt_for_username(service)
      return @keep.get(service) if @keep.present?(service)

      if !Stars.uninstalled_services.empty? and !Stars.uninstalled_services.include?(service.downcase)
        puts("You need to pick something from: #{Stars.uninstalled_services.join(', ')}")
        return exit
      end

      puts "What's your username for #{service}?"
      username = $stdin.gets.chomp
      @keep.set(service,username)
    end

  end
end
