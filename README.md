#appium-and-emulator
* Appium Server setup for android emulator
* start a container by running: docker run -i -p 4723:4723 isonic1/appium-and-emulator:latest

- Contains the following software:
	- ubuntu 14.04
	- openjdk 7
	- nodejs
	- appium server
	- android sdk 19.1.0
	- android emulator 19

#Test in IRB
$ irb

require 'appium_lib'

caps = {
  caps: {
    platformName: "Android",
    deviceName: "ANDROID",
    appActivity: 'your_app_activity',
    appWaitActivity: 'your_app_wait_activity', 
    appPackage: 'your_app_package>', 
    app: 'http://url_to_your_app_location(#localhost/webrick, s3, dropbox etc...)',
    newCommandTimeout: '9999'
  },
  appium_lib: {
    server_url: 'http://<your_docker_ip_address>:4723/wd/hub',
    wait: 300
  }
}

- Appium::Driver.new(caps).start_driver
- Appium.promote_appium_methods Object