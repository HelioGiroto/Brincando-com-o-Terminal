# Bateria

Comandos para verificar estado e porcentagem de uso da bateria

To check your laptop's battery on Linux, use the
upower command by running upower -i /org/freedesktop/UPower/devices/battery_BAT0 for detailed status and health or upower -e to list all power devices. Alternatively, you can directly access the kernel's power supply information by reading the /sys/class/power_supply/BAT0/capacity file, which provides the battery percentage. 
Using the upower command (Recommended)
This is a user-friendly and common method that provides detailed information about your battery's health and status. 

    List all power devices to find your battery's name:
    bash

`upower -e`

Look for the line containing "battery", for example, /org/freedesktop/UPower/devices/battery_BAT0.
Get detailed battery information using the path you found:
bash

`upower -i /org/freedesktop/UPower/devices/battery_BAT0`

This command shows details like current energy, full energy (design capacity), energy-full (current capacity), and other metrics to assess battery health. 

Using the /sys filesystem
This method directly accesses the information provided by the Linux kernel. 

    View battery capacity:
    bash

`cat /sys/class/power_supply/BAT0/capacity`

This command outputs the battery's remaining capacity as a percentage.
View battery status (e.g., Charging, Discharging, Full):
bash

`cat /sys/class/power_supply/BAT0/status`

Live updates for capacity (press Ctrl+C to exit):
bash - 1 second:

`watch -n1 cat /sys/class/power_supply/BAT0/capacity`

This command updates the battery percentage every second. 

If you have multiple batteries
Your system might have more than one battery. To check them, first use ls /sys/class/power_supply/ to see the available battery directories (e.g., BAT0, BAT1) and then replace BAT0 in the commands above with the correct index for the battery you want to check. 
