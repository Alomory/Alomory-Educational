import time 
from machine import Pin

button = Pin(23, Pin.IN)
LED = Pin(2, Pin.OUT)

while True:
  print(button.value())
  LED.value(button.value())
  time.sleep(1)

