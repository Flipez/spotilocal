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
  end
end
