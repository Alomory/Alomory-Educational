import network 
import time 
from umqtt.simple import MQTTClient

SERVER = "mqtt.favoriot.com"
client  = MQTTClient("umqtt_client", SERVER, user="lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj", password="lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj")

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.disconnect()

if not wlan.isconnected():
  print('connecting to network ...')
  wlan.connect('Galaxy Note20 Ultra 5G4fc9','00000000')
  
  while not wlan.isconnected():
    print('network config:', wlan.ifconfig())
    time.sleep(2)
    
    
while wlan.isconnected():
  topic = "lKv8wVWkBH7G8z2Hxn1TEQEQquKr5OMj/v2/streams"
  time.sleep(3)
  client.connect()
  print("ok")
  client.publish(topic, '{"device_developer_id": "ESP32@Alomory", "data":{"test":"test"}}')
  client.disconnect()
  time.sleep(5)
  



