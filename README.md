# HamDTMF Bash Scripts
A Lo-Fi way to automate computer control with DTMF commands over Ham Radio, OTA, audible speakers and microphone, and line-in/line-out sources. Mainly focused on Amateur Radio

# Who am I
Shayne - VK3ACN

# Requirements - for the most part

GQRX - RTLSDR Receiver software - https://gqrx.dk/
Netcat - Network swiss army knife - https://netcat.sourceforge.net/
SoX - Audio transcoding - https://github.com/chirlu/sox
multimon-ng - Audio frequency digital mode decoder - https://github.com/EliasOenal/multimon-ng
festival - text-to-speech (tts) software - http://festvox.org/festival/

# Project Details

The idea behind this project is to give examples of bash scripts to take audio from RTLSDR, Soundcard, or other sources. Decode DTMF tones from the audio sources, and perform actions based on received DTMF tones. 

Example of this is to have an RTLSDR listen on a frequency via GQRX, which is then passed to Netcat via UDP transport. Then sent to SoX to convert the audio format to something multimon-ng can convert. Which in-turn is piped to our example scripts to action received DTMF tines. So when a 1 or # is received, a CLI command is run which outputs to stdout to echo out a menu of options, similar to an automated phone system, i.e. "Press one for sales. Press 2 for support". Text is then piped through Festival text-to-speech engine, which is then sent to an ALSA device, which is plugged into a Ham Radio transmitter on the same frequency as the RTLSDR and transmitted on Ham Radio frequency as FM modulated audio.

