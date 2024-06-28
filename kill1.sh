#!/bin/bash

# Daftar port yang ingin dihentikan
ports=(9002 9003 9004 9005)

for port in "${ports[@]}"; do
    # Temukan PID dari proses yang menggunakan port tersebut
    pids=$(lsof -t -i :$port)
    
    # Jika ada proses yang ditemukan, hentikan
    if [ -n "$pids" ]; then
        echo "Killing process on port $port with PIDs: $pids"
        kill -9 $pids
    else
        echo "No process found on port $port"
    fi
done
