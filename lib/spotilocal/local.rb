module Spotilocal
  class Local
    attr_accessor :port, :csrf, :url, :oauth

    HEADERS = { Origin: 'https://open.spotify.com' }.freeze

    def initialize port: nil
      raise 'Port required' unless port
      @url = "http://localhost:#{port}"
      @csrf = get_csrf_token
      @oauth = get_oauth_token
    end

    def status
      req = Typhoeus.get("#{url}/remote/status.json",
                        params: { csrf: csrf, oauth: oauth }
                        )
      puts JSON.parse(req.response_body)
    end

    private

    def get_oauth_token
      req = Typhoeus.get('http://open.spotify.com/token', followlocation: true)
      JSON.parse(req.response_body)['t']
    end

    def get_csrf_token
      req = Typhoeus.get("#{url}/simplecsrf/token.json", headers: HEADERS)
      JSON.parse(req.response_body)['token']
    end
  end
end
