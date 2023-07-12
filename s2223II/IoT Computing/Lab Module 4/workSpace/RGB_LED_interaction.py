import time 
from machine import Pin

led1 = Pin(21,Pin.OUT)
led2 = Pin(22,Pin.OUT)
led3 = Pin(23,Pin.OUT)

while True:
  led1.value(1)
  led2.value(0)
  led3.value(0)
  print('red,green,blue',led1.value(),led2.value(),led3.value())
  time.sleep(1.5)
  led1.value(0)
  led2.value(1)
  led3.value(0)
  print('red,green,blue',led1.value(),led2.value(),led3.value())
  time.sleep(1.5)
  led1.value(0)
  led2.value(0)
  led3.value(1)
  print('red,green,blue',led1.value(),led2.value(),led3.value())
  time.sleep(1.5)
  

