# sony-vaio-keyboard-utility

This utility enables Fn key support for Sony VAIO notebooks running linux. The utility uses ACPI deamon events to detect key presses and then runs the appropriate script to enable or diable a selected feature.

The utility has only been tested on a * Sony VAIO VGN-FE38GP * runnig * Elementary OS * (Loki) and may need some modifcations in order to work on your machine but should run fine on Ubuntu.

## Installation

Simply run the installer as follows:

```
$ sudo ./install.sh
```

## Key Mapping

Currently I have mapped my "S1" key to toggle my screen brightness between it's minimum and maximum values. The "S2" enables and disables Wifi. Please feel free to changes this as per the instructions below.

## Customising Keys

In order to change a key select a file from the `events/` folder and edit the `action=` command to make the key do something new. I recommend writing a bash script to perform whatever function you need, testing it in the terminal and then having the appropriate event file's `action=` call the script with a paramater.

Don't forget to update the install.sh file inorder to make sure it copies any new scripts you create over to the correct installtion directories.

## Mapping additional keys

In order to add new keys you can run `acpi_listen` from your terminal and then press the key you want to map. 

I still need to find uses for the magnification and sleep keys. Here's an exmple of what the terminal output looks like when I press these keys:

```
$ acpi_listen
sony/hotkey SNY5001:00 00000001 00000015
button/zoom ZOOM 00000080 00000000 K
sony/hotkey SNY5001:00 00000001 0000003b
sony/hotkey SNY5001:00 00000001 00000017
button/suspend SUSP 00000080 00000000 K
sony/hotkey SNY5001:00 00000001 0000003b
```

Now map these keys so that they call a script copy one of the over event files and edit it. Copy the event you want to use to call a script and paste it in the `event=` line. Then add a new command to be called in the `action=` line.

## Acknowledgements

This code is a modified version of the /etc/acpi/asus-keyboard-backlight.sh script already shipped with Elementary OS.
