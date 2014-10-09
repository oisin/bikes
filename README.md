### basics

```
class Station
  number / name / location 
  
  can_pay
  
  bonus?
  
  open?
  
  stands - total, empty, bikes
  
```

```
class Client
  initialize(api_key)

  bikescheme('dublinbikes')
```

```
 c = Client.new("7042a5efadece1f3839371445a1ae3d0983d78b7")
 
 bikes = c.bikescheme('dublinbikes')
 
 # No such scheme dude
 
 bikes.stations -> hash of stations, based on name
 
 bikes.station(name or number)
 
 
  