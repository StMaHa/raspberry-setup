#!/bin/bash

# run raspi-config automatically
sudo raspi-config nonint do_overscan 1
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_configure_keyboard de
sudo raspi-config nonint do_wifi_country de
sudo raspi-config nonint do_change_timezone Europe/Berlin
sudo raspi-config nonint do_memory_split 128
sudo raspi-config nonint do_spi 0
sudo raspi-config nonint do_i2c 0
sudo raspi-config nonint do_serial 0

# include extra boot configuration into boot config file
sudo cp rpi4-extra-config.txt /boot/extra-config.txt
echo 'include extra-config.txt' | sudo tee -a /boot/config.txt > /dev/null

# increase size of swap file to 1024MB
sudo dphys-swapfile swapoff
sudo sed -i "s/\(CONF_SWAPSIZE *= *\).*/\11024/" /etc/dphys-swapfile
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
