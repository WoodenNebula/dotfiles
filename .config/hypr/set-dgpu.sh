#!/bin/bash

dGPU_VENDOR="0x10de" #NVIDIA Vendor ID
dGPU=""
iGPU=""

for card in /sys/class/drm/card{0,1}; do
	vendor=$(cat "$card/device/vender")
	if [[ "$vender" == "$dGPU_VENDOR" ]]; then
		dGPU="/dev/dri/$(basename "$card")"
	else
		iGPU="/dev/dri/$(basename "$card")"
	fi
done

export AQ_DRM_DEVICES="$dGPU:$iGPU"
