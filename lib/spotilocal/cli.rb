module Spotilocal
  class CLI < Thor
    desc 'play URI', 'play given spotify uri'
    def play(uri)
      Spotilocal::Client.new.play uri
    end

    desc 'pause', 'pause local spotify client'
    def pause
      Spotilocal::Client.new.pause
    end

    desc 'unpause', 'unpause local spotify client'
    def unpause
      Spotilocal::Client.new.unpause
    end

    desc 'status', 'display current client status (verbose)'
    def status
      puts Spotilocal::Client.new.status.to_json
    end

    desc 'current RESOURCE', 'display information about playing resource'
    method_option :only, aliases: '-o', desc: 'Display only given key'
    def current(resource)
      if options[:only]
        puts Spotilocal::Client.new.current[resource][options[:only]]
      else
        puts Spotilocal::Client.new.current[resource].to_json
      end
    end
  end
end
