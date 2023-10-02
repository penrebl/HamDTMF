# HamDTMF
A Lo-Fi way to automate computer control with DTMF commands over Ham Radio

# Requirements

GQRX - RTLSDR Receiver software - https://gqrx.dk/


# Project Details

Input is via RTLSDR using GQRX. Tune to RX freq in GQRX and output to UDP port 7355

Plug in USB Sound Card connected to K type connector to HT, in my case UV5R. Turn on VOX

The idea is to use NetCat to receive audio data from GQRX
