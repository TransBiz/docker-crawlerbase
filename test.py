# Created on Jan, 9, 2017
# @author: Yvictor
import os
import sys
import time
import requests
from selenium import webdriver
from pyvirtualdisplay import Display

print("Python Version: %s" % sys.version)

proxies = {'http': 'http://localhost:9100'}
for i in range(5):
    res = requests.get('http://ip.42.pl/short', proxies=proxies)
    print("current requests ip: %s"%res.text)
    time.sleep(6)


display = Display(visible=0, size=(1024, 768))
display.start()

proxy_host = os.environ.get("PROXY_HOST", 'localhost')
proxy_port = os.environ.get("PROXY_PORT", '9100')

profile = webdriver.FirefoxProfile()
profile.set_preference("network.proxy.type", 1)
profile.set_preference("network.proxy.http", proxy_host)
profile.set_preference("network.proxy.http_port", int(proxy_port))
profile.set_preference("network.proxy.ssl", proxy_host) #SSL  PROXY
profile.set_preference("network.proxy.ssl_port", int(proxy_port))
profile.update_preferences()


driver = webdriver.Firefox(firefox_profile=profile)
test_url = "http://ip.42.pl/short"
for i in range(5):
    driver.get(test_url)
    print("current browser ip: %s"%driver.page_source)
    time.sleep(6)

print("Done Selenium Work Well.")
#display.sendstop()
