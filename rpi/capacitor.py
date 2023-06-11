import network, utime, machine
import time
import ubinascii
from umqtt.simple import MQTTClient
import machine
import random

# WIFI Credentials
SSID = "myhotspot"
SSID_PASSWORD = "racemicracemate"

# Connect to Wifi
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

# MQTT Credentials
mqtt_server = '3.92.216.113'
client_id = 'DC Grid Capacitor'
user_t = 'BalanceBug'
password_t = '123'
topic_pub = 'capacitor_monitoring'
topic_sub = 'capacitor_control'
keep_alive = 30

last_message = 0
message_interval = 5
counter = 0

# Connect to MQTT Broker
def mqtt_connect():
    client = MQTTClient(client_id, mqtt_server, user=user_t, password=password_t, keepalive=60)
    client.connect()
    print('Connected to %s MQTT Broker'%(mqtt_server))
    return client

# Reconnect to MQTT Broker
def reconnect():
    print('Failed to connected to MQTT Broker. Reconnecting...')
    time.sleep(5)
    machine.reset()
    
# Obtain grid power
def grid_power():
    print('obtained grid power')

    # TODO: Write code to obtain the current grid power
    current_power = random.randint(1,10)
    return current_power

# Callback to subscribed topic
def new_message_callback(topic, msg):
    topic , msg=topic.decode('ascii') , msg.decode('ascii')
    print("Topic: "+topic+" | Message: "+msg)
    if msg == '1':
        # TODO: Insert code to charge capacitor here
        print("Capacitor Discharging!")
    elif msg == '0':
        # TODO: Insert code to discharge capacitor here
        print("Capacitor Charging!")
    else:
        print("Incorrect Message Received!")

# Connect to broker and subscribe to topics
try:
    print('connecting to MQTT Broker')
    client = mqtt_connect()
    client.set_callback(new_message_callback)
    client.subscribe(topic_sub.encode('utf-8'))

except OSError as e:
    reconnect()

last_message=time.time()

# Loop to publish repeatedly
while True:
    try:
        
        # every 10 seconds, send capacitor data to server
        current_power = grid_power()
        client.publish(topic_pub, msg=str(current_power)) 
        print('published current grid power:' + str(current_power))
        time.sleep(10)
        
        # check for updates to subscribed topic
        client.check_msg()
        
        # keep alive
        time.sleep(0.001)
        if (time.time() - last_message) > keep_alive:
              client.publish(topic_sub, "Keep alive message")
              client.publish(topic_pub, "Keep alive message")
              last_message = time.time()
    except OSError as e:
        reconnect()


