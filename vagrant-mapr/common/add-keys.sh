#!/bin/bash

# Install the Data Fabric package key
 
# Specify your HPE Passport account email and token
EMAIL=""
TOKEN=""


# Check the Linux distribution
if [ -f /etc/redhat-release ]; then
    # CentOS/RHEL/Oracle Linux
    wget --user="$EMAIL" --password="$TOKEN" -O /tmp/maprgpg.key -q https://package.ezmeral.hpe.com/releases/pub/maprgpg.key && rpm --import /tmp/maprgpg.key
    echo "Data Fabric package key installed for CentOS/RHEL/Oracle Linux."
elif [ -f /etc/lsb-release ]; then
    # Ubuntu
    wget --user="$EMAIL" --password="$TOKEN" -O /tmp/maprgpg.key -q https://package.ezmeral.hpe.com/releases/pub/maprgpg.key && sudo apt-key add /tmp/maprgpg.key
    echo "Data Fabric package key installed for Ubuntu."
else
    echo "Unsupported Linux distribution."
    exit 1
fi

# Clean up the temporary key file
rm -f /tmp/maprgpg.key

# End of script
