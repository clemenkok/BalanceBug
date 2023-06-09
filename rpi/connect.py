# import modules

import ujson
import urequests
import time
import network   # handles connecting to WiFi

# prepare data

readings = []

readings.append({
    "tile_info": [1,1,1,1,1],
    "tile_num": [1,1]
})

tile_data = ujson.dumps({"tile_info": [1,1,1,1,1],
    "tile_num": [1,1]})

print(tile_data)

# wifi config

# Connect to network
wlan = network.WLAN(network.STA_IF)
wlan.active(True)

# network name (ssid) and password:
ssid = "Pixel_7155"
password = "hello123"
wlan.connect(ssid, password)

while wlan.isconnected() == False:
        print('Waiting for connection...')
        time.sleep(1)
ip = wlan.ifconfig()[0]
print(f'Connected on {ip}')
        
# send / receive data
url = "http://192.168.34.131:8080/api/live_database"
response = urequests.post(url, headers = {'content-type': 'application/json'}, data=tile_data)
print (response.text)
