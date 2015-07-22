#!/usr/bin/env ruby
require_relative '../libs/simulator'

if STDIN.stat.size == 0
  abort <<-eos
robot.rb needs a file to run, please either:
cat FILE | robot.rb
or
robot.rb < FILE
  eos
else
  instructions = STDIN.read.split("\n")
  Simulator.new.run(instructions: instructions)
end

