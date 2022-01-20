# Description

This repo contains a bash script for getting a free Let's Encrypt certificate.

## Prerequisites

Docker must be installed.

## Usage

1. Copy this script to a folder on a Linux machine.
2. Make a subfolder called `certs`.
3. Edit the script and change the *--domains* argument to match your machine's domain.
4. Run the script. You do not need to be root.
5. The certificates are placed in the *certs* folder. They are valid for 90 days.
