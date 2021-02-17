# Dockerfile for Build Red Hat Universal Base Image 8 with additional package
## Description
The Universal Base Image is designed and engineered to be the base layer for all of your containerized applications, middleware and utilities. This base image is freely redistributable, but Red Hat only supports Red Hat technologies through subscriptions for Red Hat products.

## Documentation
[Understanding standard Red Hat base images](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/building_running_and_managing_containers/index#understanding-standard-red-hat-base-images_building-running-and-managing-containers)

## Aditional Package
List of additional package include from src/pkg-list.txt
* procps-ng
* iputils
* iproute
* ethtool
* telnet
* diffutils
* bind-utils
* wget
* jq
* openssl
* openssh-clients

For install package, you need Red Hat Subscriptions.