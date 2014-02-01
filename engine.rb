#!/usr/bin/env ruby

require_relative './gtp.rb'

while gtp_command = gets() do
    response = TurtleGTP.parse(gtp_command)
    puts response
end

