#!/bin/sh

# THE FOLLOWING SCRIPT WILL SETUP AND LOAD D1, TO LOAD D2 UNCOMMENT THE LINES BELOW 


sudo ./influxdb-1.7.10-1/usr/bin/influx -import -path=../../datasets/d1-influxdb.csv -precision=ms #> /dev/null

sudo du -sh /var/lib/influxdb/data/d1


#sudo ./influxdb-1.7.10-1/usr/bin/influx -import -path=../../datasets/d2-influxdb.csv -precision=ms #> /dev/null
#sudo du -sh /var/lib/influxdb/data/d2


