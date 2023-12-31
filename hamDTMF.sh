#!/bin/bash

callsign="Victor Charlie 3 Alpha Charlie November - VK3ACN"

msg="Welcome to the V.K.3. A.C.N. Victor Kilo 3 Alpha Charlie November Automated System. This system is open to all hams, Please feel free to explore. The menu options are as follows. Press 1 or Pound to hear this message again. Press 2 for the current local date and time. Press 4 for the current CPU Usage. Press 5 for the current computer uptime. Press 7 for contact information. Press 8 for a tongue twister. Enter one time code and hash to de-activate dead man switch"

contactinfo="V.K.3 ACN. Victor Kilo 3 Alpha Charlie November... E Mail - S H A Y N E DOT N A S H AT G MAIL DOT COM. The code for this system can be found on git hub as follows. H. T. T. P. S. COLON. SLASH. SLASH. G. I. T. H. U. B. DOT. COM. SLASH. P. E. N. R. E. B. L. SLASH. H. A. M. D. T. M. F.  or search on git hub for Papa, Echo, November, Romeo, Echo, Bravo. Press 7 to repeat contact information. If you heard this, or are interested in what I am doing, please drop me a line"

#Define Tongue Twisters
ttwister[0]="I have got a date at a quarter to eight; I'll see you at the gate, so don't be late."
ttwister[1]="I scream, you scream, we all scream for ice cream."
ttwister[2]="Xander the xylophonist played his xylophone for the fox."
ttwister[3]="I wish to wish the wish you wish to wish, but if you wish the wish the witch wishes, I won't wish the wish you wish to wish."
ttwister[4]="If two witches were watching two watches, which witch would watch which watch?"
ttwister[5]="Karl's colorful kite caught a colossal king-sized koala"
ttwister[6]="A box of biscuits, a box of mixed biscuits, and a biscuit mixer"
ttwister[7]="The seething sea ceased and thus the seething sea sufficed us."
ttwister[8]="Theophilus Thistler the thistle sifter, In sifting a sieve full of unsifted thistles thrust three thousand Thistles through the thick of his thumb."



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
				sleep 2; echo $callsign - Tongue Twister: `size=${#ttwister[@]}; index=$(($RANDOM % $size)); echo ${ttwister[$index]}` | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
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
				sleep 2; echo $callsign - `size=${#ttwister[@]}; index=$(($RANDOM % $size)); echo ${ttwister[$index]}`  | text2wave | aplay -f S16_LE -r 16000 -c 1 -t raw -D plughw:CARD=Device,DEV=0
			;;
		esac
		
		
	done
	
	
