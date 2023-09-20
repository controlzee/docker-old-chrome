#!/usr/bin/expect -f
set timeout -1

puts ""
puts "--- Starting up Xvnc, fluxbox, and noVNC server... ---"
puts ""
spawn -noecho supervisord -c /vnc/supervisord.conf

# fluxbox takes the longest to start
expect {success: fluxbox entered RUNNING state}

puts ""
puts "--- Servers started. Open http://localhost:8590/ to interact with the container. ---"
puts ""

if {[llength $argv] > 0} {
  spawn {*}$argv
}
expect
