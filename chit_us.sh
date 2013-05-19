#!/bin/sh
while [ `skb -1` != "Eng" ]
do
echo "KeyStrPress Alt_L
KeyStrPress Shift_L
KeyStrRelease Shift_L
KeyStrRelease Alt_L" | xmacroplay ":0.0"
done
