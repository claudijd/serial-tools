# Terminal - A terminal emulation script for communicating via serial

require "serialport"

port_str = ARGV.shift #"/dev/tty.usbserial-A5005DKM"
baud_rate = ARGV.shift.to_i 
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

#Build up a new instance of SerialPort
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
$stdout.sync= true
$stdin.sync = true
sp.sync = true

# Create two separate threads (one for reading and one for writing)
# The idea here is that we want async communication
reader = Thread.new { loop { IO.select([sp]); $stdout.write(sp.read_nonblock(4096)); } }
writer = Thread.new { loop { IO.select([$stdin]); sp.write($stdin.read_nonblock(4096)); }  } 

writer.join
