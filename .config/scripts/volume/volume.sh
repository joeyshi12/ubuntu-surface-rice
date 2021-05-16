#!bin/bash

volume=$(pulsemixer --get-volume | head -n1 | cut -d " " -f1)
echo $volume
