# Bruteforcer - A simple script for rolling through serial baud rates

require "serialport"

port_str = "/dev/tty.usbserial-A100FY8Y"
baud_rates = [
  9600,
  38400,
  19200,
  57600,
  115200
]
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
timeout = 5

loop do
  baud_rates.each do |baud_rate|
    puts "\n*********** START BAUD #{baud_rate} ***********\n"
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    reader = Thread.new { loop { printf("%c", sp.getc) } }
    writer = Thread.new { loop { sp.write(gets) } }
    timer = Thread.new { sleep(timeout) }

    timer.join
    reader.terminate
    writer.terminate

    sp.close
    puts "\n*********** END BAUD #{baud_rate} ***********\n"
  end
end
