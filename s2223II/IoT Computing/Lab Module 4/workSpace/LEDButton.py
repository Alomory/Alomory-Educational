import time 
from machine import Pin

button = Pin(23, Pin.IN)
LED = Pin(22, Pin.OUT)

while True:
  print(button.value())
  LED.value(not button.value())
  time.sleep(1)

