#!/bin/bash

callsign="Victor Charlie 3 Alpha Charlie November - VK3ACN"

msg="Welcome to the VK3 ACN. Victor Kilo 3 Alpha Charlie November Automated System Menu. Press 1 or Pound to hear this message again. Press 2 for the current local date and time. Press 4 for the current CPU Usage. Press 5 for the current computer uptime. Press 7 for contact information. Press 8 for a tongue twister. Enter one time code and hash to deactivate dead man switch"

contactinfo="VK3 ACN. Victor Kilo 3 Alpha Charlie November... E Mail - S H A Y N E DOT N A S H AT G MAIL DOT COM. PRESS 7 TO REPEAT"

nc -l -u 7355 | sox -t raw -esigned-integer -b16 -r 48000 - -esigned-integer -b16 -r 22050 -t raw - | multimon-ng -t raw -a DTMF -f alpha -q - | \

while read line;
	do
		echo $line
	
		case $line in
			"DTMF: 1")
				sleep 2; echo $msg | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 2")
				sleep 2; echo $callsign - `date` | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 3")
				sleep 2; echo $callsign - DTMF 3 seems broken on my end | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 4")
				sleep 2; echo $callsign - `cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}'` Percent | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 5")
				sleep 2; echo $callsign - Computer Host Uptime: `uptime` | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 6")
				sleep 2; echo $callsign | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 7")
				sleep 2; echo $contactinfo | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 8")
				sleep 2; echo s- $callsign - Theophilus Thistler the thistle sifter, In sifting a sieveful of unsifted thistles thrust three thousand Thistles through the thick of his thumb. | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 9")
				sleep 2; echo $callsign - Number 9 was detected | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: 0")
				sleep 2; echo $callsign - Number 0 was detected | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: #")
				sleep 2; echo $msg | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
			"DTMF: *")
				sleep 2; echo $callsign - Theophilus thisler, the thistle sister,  | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
		esac
		
		
	done
	
	
