# Testing with mocha

- test script should be in a folder called test
- run `npm test` leads to `"test": "mocha --reporter spec"` which will perform the test


2 main things to test atm:

- Routings: make sure all APIS are running correctly (including the corresponding controller)
- the Routing algorithm: make sure the algorithm are finding the shortest paths correctly, by performing unit tests on the 
algorithm with an input maze and the expected output. it should check for check for routingalgo(input) == answer


## Routes:

`/` 

simple get request returning status 200 and expect mocha to pass the case


`/api/all_info/dump` 

this api copies everything from Live_database.findAll() to All_info
so to test it we get Live_database.findAll() before calling the API, then check the Allinfo afterwards

`/api/live_database/latest`

this api finds the latest entry from live_database and return
test: get the latest entry before calling API and compare it afterwards

`/api/live_database/add`

this api creates a new entry in live database

```    
tile_num: req.body.tile_info,
tile_info: res.body.tile_num,
```

`/api/map_info`

waiting for my boss clemen to make it