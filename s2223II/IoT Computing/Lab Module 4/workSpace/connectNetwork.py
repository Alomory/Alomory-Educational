import network
import time

SSID = "Galaxy Note20 Ultra 5G4fc9"
PASSWORD ="00000000"

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.disconnect()
wlan.scan()
if wlan.isconnected():
  print('connected')
else:
  print('not connected')
wlan.config('mac')
wlan.ifconfig()

print('network config:', wlan.ifconfig())
