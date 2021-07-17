require_relative './helpers'

class TestBikes < Minitest::Spec

  STATIONS_URL  = 'https://api.jcdecaux.com/vls/v1/stations'
  CONTRACTS_URL = 'https://api.jcdecaux.com/vls/v1/contracts'
  API_KEY       = '111111111111111111'

  def setup
    @contracts = test_data(:contracts)
    @stations  = test_data(:stations)
    @station32 = test_data(:station32)
    @bikes     = Bikes.new(API_KEY, 'Dublin')
  end

  def test_contracts
    stub_request(:get, CONTRACTS_URL).with(query: { apiKey: API_KEY}).to_return({body: @contracts.read})

    b = @bikes.contracts

    _(b.size).must_equal 4

    _(b[1].name).must_equal 'Dublin'
    _(b[1].cities[0]).must_equal 'Dublin'
    _(b[1].country_code).must_equal 'IE'
    _(b[1].commercial_name).must_equal 'dublinbikes'
  end

  def test_stations
    stub_request(:get, STATIONS_URL).with(query: { apiKey: API_KEY, contract: 'Dublin'}).to_return({body: @stations.read})
    s = @bikes.stations

    _(s.size).must_equal 3
    _(s[2].number).must_equal 32
    _(s[2].name).must_equal "PEARSE STREET"
    _(s[2].address).must_equal "Pearse Street"
    _(s[2].bike_stands).must_equal 30
    _(s[2].available_bike_stands).must_equal 2
    _(s[2].available_bikes).must_equal 27
  end

  def test_station
    snum = 32

    stub_request(:get, STATIONS_URL + "/#{snum}").with(query: { apiKey: API_KEY, contract: 'Dublin'}).to_return({body: @station32.read})

    s = @bikes.station(snum)

    _(s).wont_be_nil
    _(s.number).must_equal snum
  end

  def test_bad_thing_happen
    # This test to be written. Mock errors come from the API.
    # response code is 400 and { "error" : "Please provide contract query parameter" }
  end
end
