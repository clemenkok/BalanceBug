"""
LIMITS
ADC pin voltage limit: 3.3 V
limit Vin and Vout to 16.5 V
Output current limit: 300 mA, in code limit to 200 mA
Target output voltage for LED: 3-15 V
"""
"""
BEHAVIOUR
- input below 2 V - duty cycle 0 (open circuit, turn off LED)
- above
- note: all duty cycles written as decimals, convert to output value by multiplying by MAX_VAL

"""



from machine import Pin, ADC, PWM

MAX_VAL = 65535
MAX_VOLT = 3.3
OC_LIMIT = 0.05
OV_LIMIT = 12

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

def saturate(duty):
    if duty > 0.95: # upper limit for duty cycle is 0.95, lower limit 0.01
        duty = 0.95
    if duty < 0.01:
        duty = 0.01
    return duty

while True:
    
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
    
    # limit current if it gets too large
    if iout >= OC_LIMIT or vout >= OV_LIMIT:
        pwm_ref -= delta
        mode = "limiting"
    
    # within current and voltage limit, but input voltage too small
    elif vin < 4.8:
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
