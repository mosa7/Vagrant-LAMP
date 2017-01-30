#!/bin/sh

#Vagrant1.9.1
#https://github.com/mitchellh/vagrant/issues/8115
systemctl restart network
systemctl restart httpd