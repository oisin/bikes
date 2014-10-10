require 'httparty'
require 'hashie'
require_relative 'cache'

class BikesOffline < Exception; end

class Bikes
  include HTTParty

  STATIONS_URL  = 'https://api.jcdecaux.com/vls/v1/stations'
  CONTRACTS_URL = 'https://api.jcdecaux.com/vls/v1/contracts'

  def initialize(apikey, scheme)
    @api = apikey
    @scheme = scheme
    # Contracts refresh daily
    @contracts_cache = Cache.new(self, :contracts_fetch)

    # Full stations list refresh every 60 seconds
    @stations_cache  = Cache.new(self, :stations_fetch, 60)
  end

  def station(num)
    invoke(STATIONS_URL + '/' + num.to_s, {contract: @scheme})
  end

  def contracts
    @contracts_cache.contents
  end

  def contracts_fetch
    invoke(CONTRACTS_URL)
  end

  def stations
    @stations_cache.contents
  end

  def stations_fetch
    invoke(STATIONS_URL, { contract: @scheme })
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
