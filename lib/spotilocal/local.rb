module Spotilocal
  class Local
    attr_accessor :port, :csrf, :url, :oauth

    HEADERS = { Origin: 'https://open.spotify.com' }.freeze

    def initialize(port: nil)
      raise 'Port required' unless port
      @url = "http://localhost:#{port}"
      @csrf = csrf_token
      @oauth = oauth_token
    end

    def status
      req = Typhoeus.get("#{url}/remote/status.json",
                         params: { csrf: csrf, oauth: oauth })
      puts JSON.parse(req.response_body)
    end
    
    def pause
      req = Typhoeus.get("#{url}/remote/pause.json",
                         params: { csrf: csrf, oauth: oauth, pause: 'true' })
    end
    
    def unpause
      req = Typhoeus.get("#{url}/remote/pause.json",
                         params: { csrf: csrf, oauth: oauth, pause: 'false' })
    end

    private

    def oauth_token
      req = Typhoeus.get('http://open.spotify.com/token', followlocation: true)
      JSON.parse(req.response_body)['t']
    end

    def csrf_token
      req = Typhoeus.get("#{url}/simplecsrf/token.json", headers: HEADERS)
      JSON.parse(req.response_body)['token']
    end
  end
end
