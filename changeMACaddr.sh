#!/bin/bash

sudo ifconfig wlo1 down

sudo ifconfig wlo1 hw ether f0:76:6f:a1:18:da

sudo ifconfig wlo1 up

ifconfig

