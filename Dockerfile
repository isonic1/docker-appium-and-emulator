FROM ksoichiro/android
MAINTAINER isonic1 

# Main Android SDK                 
RUN echo y | android update sdk --all --filter platform-tools,build-tools-19.1.0,sysimg-19,android-19,extra-android-support,extra-google-play-services --no-ui --force

# Set up and run emulator
RUN echo no | android create avd --force -n test -t android-19
# Avoid emulator assumes HOME as '/'.
ENV HOME /root
ADD wait-for-emulator /usr/local/bin/
ADD start-emulator /usr/local/bin/
RUN echo | adb devices

RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN mkdir /opt/appium
RUN useradd -m -s /bin/bash appium
RUN chown -R appium:appium /opt/appium

USER appium
ENV HOME /home/appium

RUN cd /opt/appium && npm install appium

EXPOSE 4723
CMD /opt/appium/node_modules/appium/bin/appium.js