#!/bin/bash

#searches for open MYSQL ports

echo "enter QUartet 1"
read IP1

echo "enter QUartet 2"
read IP3

echo "enter QUartet 3"
read IP5

echo "enter 2nd Quartet 3"
read IP6

echo "enter QUartet 4"
read IP7

echo "enter 2nd Quartet 4"
read IP8


echo "enter the port # you want to scan for"
read port

nmap -sT $IP1.$IP3.$IP5-$IP6.$IP7-$IP8 -p $port >/dev/null -oG MYSQLscan

cat MYSQLscan | grep open > openMYSQLports

cat openMYSQLports
