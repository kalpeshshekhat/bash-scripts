#!/bin/bash
/opt/IBM/ITM/bin/itmcmd agent start lz
/opt/IBM/ITM/bin/itmcmd agent start 51
/opt/IBM/ITM/bin/itmcmd agent start 54
/opt/IBM/ITM/bin/itmcmd agent -o syslog start lo
/opt/IBM/ITM/bin/cinfo -R
