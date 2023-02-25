#!/usr/bin/env bash

# Update package cache
apt-get update

# Install packages
apt-get install -y hfsprogs  bcmwl-kernel-source

# Clean up package cache
apt-get clean
