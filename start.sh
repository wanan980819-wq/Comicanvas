#!/bin/bash
# Comicanvas — 启动 ComfyUI
# 用法：bash start.sh
set -e

COMFY_DIR=/root/ComfyUI
PORT=6006

cd "$COMFY_DIR"
exec venv/bin/python main.py --listen 0.0.0.0 --port "$PORT"
