Linda Arduino FloorSensor
=========================
report Arduino's floor-sensor values with RocketIO::Linda

* https://github.com/shokai/linda-arduino-floorsensor
* write tuple ["sensor", "floor", 80] every 0.1 seconds.


Dependencies
------------
- [Arduino Firmata](https://github.com/shokai/arduino_firmata)
- Ruby 1.8.7 ~ 2.0.0
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler foreman
    % bundle install


Setup Arduino
-------------

Install Arduino Firmata v2.2

    Arduino IDE -> [File] -> [Examples] -> [Firmata] -> [StandardFirmata]


sensors
- floor
  - analog input 5
  - piezo sensor and 4MΩ

### floor sensor

- http://www.youtube.com/watch?v=QxeZ2c8Y20Q

<img src="http://shokai.org/archive/file/3bbf7df0dddeacc27a921c9f2e5bc7ff.png">
<img src="http://shokai.org/archive/file/6a2788ed7d9290fe3d31932b163674c6.png">


Run
---

set ENV var "LINDA_BASE" and "LINDA_SPACE"

    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % bundle exec ruby linda-arduino-floorsensor.rb


oneline

    % LINDA_BASE=http://linda.example.com LINDA_SPACE=test  bundle exec ruby linda-arduino-floorsensor.rb


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-arduino-floorsensor -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-arduino-floorsensor-arduino-1.plist

for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-arduino-floorsensor -d `pwd` -u `whoami`
    % sudo service linda-arduino-floorsensor start
