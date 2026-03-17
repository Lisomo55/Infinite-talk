#!/usr/bin/env bash
set -e

echo "[start.sh] Starting ComfyUI..."
python /comfyui/main.py --listen 0.0.0.0 --port 8188 &

echo "[start.sh] Waiting for ComfyUI to become available..."
until curl -s http://127.0.0.1:8188/system_stats > /dev/null 2>&1; do
    sleep 2
done
echo "[start.sh] ComfyUI is ready."

echo "[start.sh] Starting RunPod handler..."
exec python -u /rp_handler.py
