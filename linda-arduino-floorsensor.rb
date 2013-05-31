#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra/rocketio/linda/client'
require 'arduino_firmata'
$stdout.sync = true

arduino = ArduinoFirmata.connect ENV["ARDUINO"]
puts "firmata board version v#{arduino.version}"

url   = ENV["LINDA_BASE"]  || ARGV.shift || "http://localhost:5000"
space = ENV["LINDA_SPACE"] || "test"
puts "connecting.. #{url}"
linda = Sinatra::RocketIO::Linda::Client.new url
ts = linda.tuplespace[space]

linda.io.on :connect do  ## RocketIO's "connect" event
  puts "connect!! <#{linda.io.session}> (#{linda.io.type})"
end

linda.io.on :disconnect do
  puts "RocketIO disconnected.."
end

loop do
  floor = arduino.analog_read 5
  puts "floor : #{floor}"
  ts.write ["sensor", "floor", floor]
  sleep 0.1
end
