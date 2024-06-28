#!/bin/bash

# Daftar port yang ingin dihentikan
ports=(8002 8003 8004 8005)

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
