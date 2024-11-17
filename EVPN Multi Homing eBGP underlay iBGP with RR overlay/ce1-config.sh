#!/bin/bash
# creating bond interface w/LACP
ip link add bond0 type bond mode 802.3ad
ip link add bond1 type bond mode 802.3ad
ip link set address 00:c1:ab:00:00:11 dev bond0
ip link set address 00:c1:ab:00:00:12 dev bond1
ip addr add 192.168.0.11/24 dev bond0

ip link set eth1 down 
ip link set eth2 down
ip link set eth3 down
ip link set eth4 down
ip link set eth1 master bond0
ip link set eth2 master bond0
ip link set eth3 master bond1
ip link set eth4 master bond1
ip link set eth1 up 
ip link set eth2 up  
ip link set eth3 up  
ip link set eth4 up  
ip link set bond0 up
ip link set bond1 up

ip link add link bond1 name bond1.10 type vlan id 10
ip addr add 192.168.1.12/24 dev bond1.10
ip link set dev bond1.10 up