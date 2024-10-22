#!/bin/bash

kvm=""

if [ $(arch) != "arm64" ]; then
	kvm="-enable-kvm -cpu host"
	echo "[$(arch)] kvm enabled"
else
	kvm="-accel tcg,tb-size=512"
	echo "[$(arch)] no kvm"
fi

qemu-system-x86_64 \
	-machine q35 \
	-smp 4 \
	$kvm \
	-m 8G -smp 4 -accel hvf -accel tcg \
	-hda ./RainFall.iso  \
	-netdev user,id=vmnic,hostname=lfshost,hostfwd=tcp::4242-:4242 \
	-device virtio-net,netdev=vmnic \
	-device virtio-rng-pci \

#	-net nic,model=virtio \
