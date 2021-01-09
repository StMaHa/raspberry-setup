#!/bin/bash

sudo raspi-config nonint do_overscan 1
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_configure_keyboard de
sudo raspi-config nonint do_wifi_country de
sudo raspi-config nonint do_change_timezone Europe/Berlin
sudo raspi-config nonint do_memory_split 128
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_serial 0

sudo cp rpi4-extra-config.txt /boot/extra-config.txt
echo 'include extra-config.txt' | sudo tee -a /boot/config.txt > /dev/null
