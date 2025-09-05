#!/bin/bash
sudo apt update -y
sudo apt install -y stress

stress --cpu 8 --timeout 900
# This script installs the stress tool and runs it to stress the CPU for 15 minutes (900 seconds).
# Adjust the number of CPUs and timeout as needed.
