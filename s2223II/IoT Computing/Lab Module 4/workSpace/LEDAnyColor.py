import time 
from machine import Pin

led = Pin(23,Pin.OUT)

while True:
  led.value(1)
  print(led.value())
  time.sleep(2)
  led.value(0)
  print(led.value())
  time.sleep(1)

