import time
from machine import Pin, ADC

pot = ADC(Pin(34))
pot.atten(ADC.ATTN_11DB)
pot_value = pot.read()


while True:
  if pot_value >1400:
    print(pot_value)
    print('Greater than 1400')
    
  else:
    print(pot_value)
    print('Less than 1400')
    
  time.sleep(2)
  pot_value = pot.read()

