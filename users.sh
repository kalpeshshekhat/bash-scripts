#!/bin/bash

groupadd -g 2000 sapusers
useradd -u 2001 -G 2000 -m -c "pavan.masani@capgemini.com" pavanm
useradd -u 2002 -G 2000 -m -c "jins.baby@capgemini.com" jinsb
useradd -u 2003 -G 2000 -m -c "satheesh.siddavatam@capgemini.com" satheeshs 
useradd -u 2004 -G 2000 -m -c "alok.chandra@capgemini.com" alokc
useradd -u 2005 -G 2000 -m -c "pavan.samadi@capgemini.com" pavank
useradd -u 2006 -G 2000 -m -c "ahmad.faraz@capgemini.com" ahmadf
useradd -u 2007 -G 2000 -m -c "abhishek.f.singh@capgemini.com" abhisheks

echo -e "pavanm\npavanm"|passwd pavanm ; passwd -e pavanm
echo -e "jinsb\njinsb"|passwd jinsb ; passwd -e jinsb
echo -e "satheeshs\nsatheeshs"|passwd satheeshs ; passwd -e satheeshs
echo -e "alokc\nalokc"|passwd alokc ; passwd -e alokc
echo -e "pavank\npavank"|passwd pavank ; passwd -e pavank
echo -e "ahmadf\nahmadf"|passwd ahmadf ; passwd -e ahmadf
echo -e "abhisheks\nabhisheks"|passwd abhisheks ; passwd -e abhisheks
