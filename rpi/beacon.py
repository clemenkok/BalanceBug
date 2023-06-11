# boot.py -- run on boot-up
import network, utime, machine
import time
import ubinascii
from umqtt.simple import MQTTClient
import machine
import random

# Replace the following with your WIFI Credentials
SSID = "myhotspot"
SSID_PASSWORD = "racemicracemate"


def do_connect():
    sta_if = network.WLAN(network.STA_IF)
    if not sta_if.isconnected():
        print('connecting to network...')
        sta_if.active(True)
        sta_if.connect(SSID, SSID_PASSWORD)
        while not sta_if.isconnected():
            print("Attempting to connect....")
            utime.sleep(1)
    print('Connected! Network config:', sta_if.ifconfig())
    
print("Connecting to your wifi...")
do_connect()

mqtt_server = '3.92.216.113'
client_id = 'PicoW_1'
user_t = 'BalanceBug'
password_t = '123'
topic_sub = 'beacon_1_control'
keep_alive=30

last_message = 0
message_interval = 5
counter = 0

def mqtt_connect():
    client = MQTTClient(client_id, mqtt_server, user=user_t, password=password_t, keepalive=60)
    client.connect()
    print('Connected to %s MQTT Broker'%(mqtt_server))
    return client

def reconnect():
    print('Failed to connected to MQTT Broker. Reconnecting...')
    time.sleep(5)
    machine.reset()

# This code is executed once a new message is published
def new_message_callback(topic, msg):
    topic , msg=topic.decode('ascii') , msg.decode('ascii')
    print("Topic: "+topic+" | Message: "+msg)
    if msg == '1':
        # TODO: Insert code to turn LED on here
        print("LED Turned on!")
    elif msg == '0':
        # TODO: Insert code to turn LED off here
        print("LED Turned off!")
    else:
        print("Incorrect Message Received!")

try:
    print("Connecting to MQTT Broker")
    client = mqtt_connect()
    client.set_callback(new_message_callback)
    client.subscribe(topic_sub.encode('utf-8'))

except OSError as e:
    reconnect()

last_message=time.time()

# Main loop
while True:
    try:
        client.check_msg()
        time.sleep(0.001)
        if (time.time() - last_message) > keep_alive:
              client.publish(topic_sub, "Keep alive message")
              last_message = time.time()

    except OSError as e:
        print(e)
        reconnect()
        pass

client.disconnect()

