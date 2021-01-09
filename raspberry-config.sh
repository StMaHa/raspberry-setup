#!/bin/bash

sudo raspi-config nonint do_overscan 1
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_configure_keyboard de
sudo raspi-config nonint do_wifi_country de
sudo raspi-config nonint do_change_timezone Europe/Berlin

sudo cp rpi4-extra-config.txt /boot/extra-config.txt
echo 'include extra-config.txt' | sudo tee -a /boot/config.txt > /dev/null
