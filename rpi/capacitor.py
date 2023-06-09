# import modules
import socket
import ujson
import urequests
import time
import network  
from machine import Pin

# PIN allocation (blank, not sure what pins)

# wifi config -----------------------------------------------------------------
# Connect to network
wlan = network.WLAN(network.STA_IF)
wlan.active(True)

# fix static ip
wlan.ifconfig(('192.168.25.157', '255.255.255.0', '192.168.0.1', '8.8.8.8'))

# network name (ssid) and password:
ssid = "Pixel_7155"
password = "hello123"
wlan.connect(ssid, password)

# check for connection
while wlan.isconnected() == False:
        print('Waiting for connection...')
        time.sleep(1)
ip = wlan.ifconfig()[0]
print(f'Connected on {ip}')

# pin configurations and data preparation ------------------------------------

# process grid data here and JSONify it
grid_data = ujson.dumps({"voltage": "3V"})
print(grid_data)

# sending data out to server ----------------------------------------------------

# send data to API endpoint on LAN Wi-Fi Interface of my laptop
url = "http://192.168.25.131:8080/api/live_database" # note check Wi-Fi interface IP address for my PC
response = urequests.post(url, headers = {'content-type': 'application/json'}, data=grid_data)
print (response.text)
