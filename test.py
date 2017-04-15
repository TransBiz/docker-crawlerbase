# Created on Jan, 9, 2017
# @author: Yvictor

from selenium import webdriver
from pyvirtualdisplay import Display
import sys

print("Python Version: %s" % sys.version)

display = Display(visible=0, size=(1920, 720))
display.start()

driver = webdriver.Firefox()
test_url = "http://twtraffic.tra.gov.tw/twrail/"
driver.get(test_url)
print("Done Selenium Work Well.")
display.close()
