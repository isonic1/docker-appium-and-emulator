#appium-and-emulator
* Appium Server setup for android emulator
* start a container by running either: 
	- docker run -i -p 4723:4723 isonic1/appium-and-emulator:latest
	- docker run --privileged -v /dev/bus/usb:/dev/bus/usb -i -p 4723:4723 isonic1/appium-and-emulator:latest
	
- Contains the following software:
	- ubuntu 14.04
	- openjdk 7
	- nodejs
	- appium server
	- android sdk 19.1.0
	- android emulator 19

#Test in IRB
$ irb

2.1.1 :199 > require 'appium_lib'

2.1.1 :199 > caps = {
  				caps: {
    				platformName: "Android",
    				deviceName: "ANDROID",
    				appActivity: 'your_app_activity',
    				appWaitActivity: 'your_app_wait_activity', 
    				appPackage: 'your_app_package>', 
    				app: 'http://url_to_your_app_location(e.g.localhost/webrick, s3, dropbox)',
    				newCommandTimeout: '9999'
  			  	},
  			  	appium_lib: {
    				server_url: 'http://your_docker_ip_address:4723/wd/hub',
    				wait: 300
 			   	}
			}

2.1.1 :199 > Appium::Driver.new(caps).start_driver
2.1.1 :199 > Appium.promote_appium_methods Object