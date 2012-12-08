# Bruteforcer - A simple script for rolling through serial baud rates

require "serialport"

port_str = ARGV.shift #"/dev/tty.usbserial-A5005DKM"
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
    puts "\n*********** START #{baud_rate}-#{data_bits}-#{parity}-#{stop_bits} ***********\n"
    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    $stdout.sync= true
    sp.sync = true
    reader = Thread.new { loop { IO.select([sp]); $stdout.write(sp.read_nonblock(4096)); } }
    writer = Thread.new { loop { sp.write(gets) } }
    timer = Thread.new { sleep(timeout) }

    timer.join
    reader.terminate
    writer.terminate

    sp.close
    puts "\n*********** END #{baud_rate}-#{data_bits}-#{parity}-#{stop_bits} ***********\n"
  end
end
