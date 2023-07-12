import network
import time
from umqtt.simple import MQTTClient

SERVER = "mqtt.favoriot.com"
client  = MQTTClient("umqtt_client", SERVER, user="lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj", password="lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj")

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.disconnect()

def sub_callback(topic, msg):
  print((topic,msg))

if not wlan.isconnected():
  print('connecting to network ...')
  wlan.connect('Galaxy Note20 Ultra 5G4fc9','00000000')
  
  while not wlan.isconnected():
    print('network config:', wlan.ifconfig())
    time.sleep(2)
    
    
  while wlan.isconnected():
    topic1 = "lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj"
    time.sleep(3)
    client.set_callback(sub_callback)
    client.connect()
    print("ok")
    client.subscribe(topic1)
    while True:
      if True:
        client.wait_msg()
      else:
        client.check_msg()
        time.sleep(1)
        
    client.disconnect()

