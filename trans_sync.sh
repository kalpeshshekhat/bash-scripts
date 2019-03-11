#!/bin/bash

rsync -rlptv --rsh="ssh -v" /usr/sap/trans/* pw1adm@10.100.18.29:/usr/sap/trans/ &> /tmp/rsync_log
