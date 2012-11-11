# Terminal - A terminal emulation script for communicating via serial

require "serialport"

port_str = "/dev/tty.usbserial-A100FY8Y"
baud_rate = 115200
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE

#Build up a new instance of SerialPort
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)

# Create two separate threads (one for reading and one for writing)
# The idea here is that we want async communication
reader = Thread.new { loop { puts sp.gets } }
writer = Thread.new { loop { sp.write(gets) } }

writer.join
