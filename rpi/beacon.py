# import modules
import socket
import time
import network  
from machine import Pin

# pin configurations and data preparation ------------------------------------

# PIN allocation 
led = Pin(15, Pin.OUT)

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

# receive data from server and taking action afterwards ----------------------------------------------------

# bind to IP addresses: 0.0.0.0 for all IP address in LAN

addr = socket.getaddrinfo('0.0.0.0', 80)[0][-1] # listen for all ip addresses (need to check if this works for multiple devices)

s = socket.socket()
s.bind(addr)
s.listen(1)

print('listening on', addr)

# listening for incoming requests on the socket
while True:
    try:
        # we accept incoming connections based off the ip address we are listening on
        cl, addr = s.accept()
        print('client connected from', addr)
        request = cl.recv(1024)
        # converts the request data into a string
        request = str(request)
        print(request)
        
        # this checks the request string, finding whether "light_on" is inside, and returns its position
        light_on = request.find("light_on") # returns number of first occurrence of light_on within the request string
        light_off = request.find("light_off") # returns number of first occurrence of light_on within the request string
        print(light_on) 
        
        # so if light on was found, its integer position is given. else if it was not found, -1 would be returned from .find(), thus triggering this
        if light_on != -1:	# found light_on 
            print("led on")
            led.value(1) # switches on LED (TODO: replace this with the code to turn on)
            stateis = "LED is ON"
        
        # likewise for light_off
        if light_off != -1: # found light_off
            print("led off")
            led.value(0) # switches off LED (TODO: replace this with the code to turn off)
            stateis = "LED is OFF"

        cl.send('OK')
        cl.close()

    except OSError as e:
        cl.close()
        print('connection closed')

