# boot.py -- run on boot-up
import network, utime, machine
import time
import ubinascii
from umqtt.simple import MQTTClient
import machine
import random

# Replace the following with your WIFI Credentials
SSID = "Pixel_7155"
SSID_PASSWORD = "hello123"


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

mqtt_server = '52.90.88.42'
client_id = 'PicoW'
user_t = 'BalanceBug'
password_t = '123'
topic_pub = 'hello'

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

while True:
    try:
        client = mqtt_connect()
        client.publish(topic_pub, msg='Hello from Pico!')
        print('published')
        time.sleep(50)
    except OSError as e:
        reconnect()

