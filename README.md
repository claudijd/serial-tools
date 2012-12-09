# Serial-Tools

Some ruby scripts for serial communication hacking and other fun stuff.

You can use it to talk to a number of device types, including:

- RaspberryPi
- Andriods/iPhones/iPads
- Arduino
- SOHO Device Boards
- Old School Modems

Really any RS232(5v) or UART(3.3v) capatible device(s) are fair game.

If you can think of any other popular ones I missed, send a pull or let me know.

## Setup

Install the serialport gem

```bash
gem install serialport
```

Clone this github repo with git

```bash
git clone git://github.com/claudijd/serial-tools.git
cd serial-tools
```

## Example Usage(s)

1.) Connect your USB to serial device to your machine

2.) Connect your serial device to your target project

3.) Detect the name of that device with detect_usb_serial_device.rb

```bash
ruby detect_usb_serial_device.rb
Looking for locally connected serial devices
Found 2 connected serial devices
  * /dev/tty.usbserial-A100FY8Y
  * /dev/cu.usbserial-A100FY8Y
```

4.) Determine the target baud rate settings with detect_serial_baudrate.rb

```bash
ruby detect_serial_baudrate.rb /dev/tty.usbserial-A100FY8Y

*********** START 57600-8-0-1 ***********
<repeatedly hit enter and see if you get prompt back>
*********** END 57600-8-0-1 ***********

<snip>

*********** 115200 2400-8-0-1 ***********
Debian GNU/Linux wheezy/sid raspberrypi ttyAMA0

raspberrypi login: 

*********** END 115200-8-0-1 ***********
```

5.) Connect to the device with terminal.rb

```bash
ruby terminal.rb /dev/tty.usbserial-A100FY8Y 115200

Debian GNU/Linux wheezy/sid raspberrypi ttyAMA0

raspberrypi login: 

```

## Contributing

If you're interested in contributing to this project, please see [CONTRIBUTING.md](https://github.com/claudijd/serial-tools/blob/master/CONTRIBUTING.md)
