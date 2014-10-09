### v0.0.1 - simple wrapper for HTTP invocations

Wraps the results from the web service at [JC Decaux](https://developer.jcdecaux.com/#/opendata/vls?page=getstarted) in `Hashie::Mash` objects for ease of access.

You will need to get a developer key from the website to participate.

Make a client - send your API key and the 'contract' you are targeting

```
require 'bikes'

b = Bikes.new(YOUR_API_KEY, "Dublin")
```

Get an array of the stations for that contract
```
stations = b.stations
```

Get details of a specific station, uses the station number

```
> s = b.station(88)
> s.name
 => "BLACKHALL PLACE"
> s.available_bikes
 => 26
> s.available_bike_stands
 => 4
```

Get an array of all the 'contracts' that are deployed - each contract refers to one or more cities covered by a specific instance of the bike scheme

```
b.contracts
```
