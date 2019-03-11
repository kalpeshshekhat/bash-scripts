#!/bin/bash

zypper rr 1
zypper ar -c -t yast2 "iso:/?iso=/soft-mount/scripts/files/SLE-12-SP3-Server-DVD-x86_64-GM-DVD1.iso" "SLES12SP3"
