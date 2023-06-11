# Raspberry Pi Pico W Code

What's in here:  
`beacon.py` - code to load on the Pico W to power on/off the beacon  
`capacitor.py` - code to send data out and to control the capacitor  

## Useful Commands 

```
mosquitto_pub -u pico -P picopassword -t 'hello' -m 'Hello World!'
mosquitto_sub -d -t hello -u pico -P picopassword
```