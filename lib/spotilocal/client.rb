module Spotilocal
  class Client
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
      !lcall(:pause, params: { pause: 'true' })['playing']
    end

    def unpause
      lcall(:pause, params: { pause: 'false' })['playing']
    end

    private

    def lcall(loc, params: {}, resource: :remote)
      req = Typhoeus.get("#{url}/#{resource}/#{loc}.json",
                         params: params.merge(csrf: csrf, oauth: oauth))
      JSON.parse(req.response_body)
    end

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