#!/bin/bash

# Update CentOS with any patches except kernel
yum install -y deltarpm
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen nc telnet

