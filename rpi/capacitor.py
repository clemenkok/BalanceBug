# import modules
import ujson
import urequests
import time
import network  
from machine import Pin
import _thread
import socket

# PIN allocation (TODO: edit pin alloc)
led = Pin(15, Pin.OUT)

# Connect to network
def connect_to_wifi():
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

# send grid data to API endpoint, thread 1
def send_grid_data():
        while True:
                # TODO: code here to obtain relevant grid data (energy, voltage etc)
                grid_data = ujson.dumps({"voltage": "3V"})
                url = "http://192.168.25.131:8080/api/live_database" # note check Wi-Fi interface IP address for my PC
                response = urequests.post(url, headers = {'content-type': 'application/json'}, data=grid_data)
                print (response.text)
                time.sleep(5)

# receive commands from server to charge / discharge capacitor, thread 2

def control_capacitor():
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
                        
                        # this checks the request string, finding whether "charge" / "discharge" is inside, and returns its position
                        charge = request.find("charge") # returns index of first occurrence of charge within the request string
                        discharge = request.find("discharge") # returns index of first occurrence of discharge within the request string
                        
                        # so if charge was found, its integer position is given. else if it was not found, -1 would be returned from .find(), thus triggering this
                        if charge != -1:	# found instruction to charge
                                print("charge")
                                led.value(1) # charges (TODO: replace this with the code to charge)
                              
                        # likewise for discharge
                        if discharge != -1:     # found discharge
                                print("discharge")
                                led.value(0) # discharges (TODO: replace this with the code to discharge)

                        cl.send('OK')
                        cl.close()

                except OSError as e:
                        cl.close()
                        print('connection closed')



# main loop ----------------------------------------------------

# connect to wifi
connect_to_wifi()

# thread 1: continually push data to server
first_thread = _thread.start_new_thread(send_grid_data, ())

# thread 2: receive data and charge/discharge capacitor
control_capacitor()