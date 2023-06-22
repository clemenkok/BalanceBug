# boot.py -- run on boot-up
import network, utime, machine
import time
import ubinascii
from umqtt.simple import MQTTClient
import machine
import random

from machine import Pin, ADC, PWM

MAX_VAL = 65535
MAX_VOLT = 3.3
OC_LIMIT = 0.200
OV_LIMIT = 5

vret_pin = ADC(Pin(26)) # voltage across 1.02 ohm resistor
vout_pin = ADC(Pin(28)) # measured voltage is 0.2 of actual value
vin_pin = ADC(Pin(27))  # measured voltage is 0.2 of actual value

pwm = PWM(Pin(0))
pwm.freq(100000)
pwm_en = Pin(1, Pin.OUT)

count = 0 # just to add delay
pwm_out = 0
pwm_ref = 0.38
delta = 0.02
mode = "normal"
switchOn = False;

def saturate(duty):
    if duty > 0.95: # upper limit for duty cycle is 0.95, lower limit 0.01
        duty = 0.95
    if duty < 0.01:
        duty = 0.01
    return duty


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

mqtt_server = '54.204.201.39'
client_id = 'PicoW_Blue'
user_t = 'BalanceBug'
password_t = '123'
topic_sub = 'blue_beacon'
keep_alive=30
topic_pub = 'echo'

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
    global switchOn
    if msg == "ON":
        # TODO: Insert code to turn LED on here
        switchOn = True;
        print("commanded LED to turn on!")
    elif msg == "OFF":
        # TODO: Insert code to turn LED off here
        switchOn = False;
        print("commanded LED to turn off!")
    else:
        print("Incorrect Message Received!")

try:
    print("Connecting to MQTT Broker")
    client = mqtt_connect()
    client.set_callback(new_message_callback)
    client.subscribe(topic_sub.encode('utf-8'))
    client.publish(topic_pub, 'Blue beacon connected')

except OSError as e:
    reconnect()

last_message=time.time()

# Main loop
while True:
    try:
        client.check_msg()
        time.sleep(0.001)
        if (time.time() - last_message) > keep_alive:
              client.publish('keepalive', "Keep alive message Blue")
              last_message = time.time()
        
        pwm_en.value(1)
        
        # read a raw analog value in the range 0-65535
        # these correspond to a range of 0-3.3 V
        vin_u16 = vin_pin.read_u16() 
        vout_u16 = vout_pin.read_u16()
        vret_u16 = vret_pin.read_u16()
        
        # process raw values, proper units
        vin = vin_u16 / MAX_VAL * MAX_VOLT * 5
        vout = vout_u16 / MAX_VAL * MAX_VOLT * 5
        vret = vret_u16 / MAX_VAL * MAX_VOLT
        iout = vret/1.02
        
        if switchOn:
            print("switched on!")
            
        
        # limit current if it gets too large
        if (iout >= OC_LIMIT or vout >= OV_LIMIT) and switchOn:
            pwm_ref -= delta
            mode = "limiting"
        
        # within current and voltage limit, but input voltage too small
        elif vin < 4.8 or not switchOn:
            pwm_ref = 0
            mode = "off"
        
        # current too small
        else:
            pwm_ref += delta
            mode = "LED on"

        pwm_out = saturate(pwm_ref)
        pwm_out_u16 = int(pwm_out*MAX_VAL)
        pwm.duty_u16(pwm_out_u16)        
        
        count += 1
        
        if count > 4000:
            print("Vin = {:.3f}".format(vin)) # format number as an integer
            print("Vout = {:.3f}".format(vout))
            print("Vret = {:.3f}".format(vret))
            print("Current = {:.3f}".format(iout))
            print("Duty = {:.3f}".format(pwm_out))
            print("Mode: " + mode)
            print("")
            
            count = 0

    except OSError as e:
        print(e)
        reconnect()
        pass
    
    

    
    

client.disconnect()




