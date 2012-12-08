# A tool for detecting the names of locally connected FTDI/UART Devices
#
# Tested on Mac OSX and Linux (if you have Windows suggestions, please send a pull)

puts "Looking for locally connected serial devices"

device_styles = [
  "/dev/tty.usbserial*",
  "/dev/cu.usbserial*",
  "/dev/ttyUSB*",
  "/dev/tty.KeySerial*"
]

results = []

device_styles.each do |dev_style|
  Dir.glob(dev_style).each do |dev|
    results << dev
  end
end

puts "Found #{results.size} connected serial devices"
results.each {|d| puts "  * " + d}
