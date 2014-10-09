require 'httparty'
require 'hashie'

class BikesOffline < Exception; end

class Bikes
  include HTTParty

  STATIONS_URL  = 'https://api.jcdecaux.com/vls/v1/stations'
  CONTRACTS_URL = 'https://api.jcdecaux.com/vls/v1/contracts'

  def initialize(apikey, scheme)
    @api = apikey
    @scheme = scheme
  end

  def stations
    invoke(STATIONS_URL, { contract: @scheme})
  end

  def contracts
    invoke(CONTRACTS_URL)
  end

  def station(num)
    invoke(STATIONS_URL + '/' + num.to_s, {contract: @scheme})
  end

  private

  def invoke(url, queryx = {})
    response = self.class.get(url, { query: { apiKey: @api}.merge(queryx)})
    raise BikesOffline unless response.code == 200

    por = JSON.parse(response.body)
    if (por.is_a? Array)
      por.map{|ob| Hashie::Mash.new(ob)}
    else
      Hashie::Mash.new(por)
    end
  end
end
