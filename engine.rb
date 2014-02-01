#!/usr/bin/env ruby

require_relative './gtp.rb'
require_relative './models.rb'

board = Turtle::Board.new()
gtp = Turtle::GTP.new()

while command = gets() do
    response = gtp.parse(command)
    puts response
end

