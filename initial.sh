#A short script used at the start of HTB attempts; not for recommended for live use.
#!/bin/bash

nmap -T4 -sV --top-ports 100 --open --reason -oX $2_nmap_fast $1
nmap -T4 -p- -v -sC -sV --open --reason -oX $2_nmap $1 
xsltproc $2_nmap -o $2_tcp.html
nmap -sU --top-ports 100 -v -oX $2_nmap_udp $1
xsltproc $2_nmap_udp -o $2_udp.html
autorecon $1
