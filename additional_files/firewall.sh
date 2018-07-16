#!/bin/bash
firewall-cmd --zone=internal --add-interface=virbr0
firewall-cmd --zone=internal --add-interface=virbr1
firewall-cmd --zone=internal --add-interface=virbr2
firewall-cmd --zone=internal --add-interface=vnet0
firewall-cmd --zone=internal --add-interface=vnet1
firewall-cmd --zone=internal --add-service=mountd
firewall-cmd --zone=internal --add-service=nfs
firewall-cmd --zone=internal --add-service=dhcp
firewall-cmd --zone=internal --add-port=9000/tcp
