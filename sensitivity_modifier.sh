#!/bin/sh

DEVICE_ID=`xinput list | grep TrackPoint | awk '{print $6}' | awk -F'=' '{print $2}'`
PROP_ID=`xinput list-props $DEVICE_ID | grep "Accel Speed (" | awk '{print $4}' | sed 's/[^0-9]*//g'`

if [ $1 != ""]; then
    xinput set-prop $DEVICE_ID $PROP_ID $i
else
    xinput set-prop $DEVICE_ID $PROP_ID 0.8

if [ $? -ne 0 ];
then
    xinput set-prop $DEVICE_ID $PROP_ID 0.8
    if [ $? -ne 0 ];
    then
        echo "Failed to modify trackpoint sensitivity : $?"
        exit 1
else
    echo "Successfully modified trackpoint sensitivity"
fi

