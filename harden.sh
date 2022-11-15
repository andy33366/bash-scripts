#!/bin/bash

sudo ufw reset

sudo ufw default deny

sudo ufw deny SSH

sudo ufw deny 22

sudo ufw enable

sudo ufw status verbose
