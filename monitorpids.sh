#!/bin/bash

exec > >(tee monitorpids.log) 2>&1

ss -tulpn | grep -oP 'pid=\K[0-9]+' | sort -u

for item in $(sudo ss -tulpn | grep -oP 'pid=\K[0-9]+' | sort -u)
do
	ls -l /proc/$item/exe
done
