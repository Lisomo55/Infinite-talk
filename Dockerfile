# Base image — ComfyUI + RunPod serverless handler pre-installed
FROM runpod/worker-comfyui:latest-base

# Pin to exact ComfyUI version you tested with
RUN cd /comfyui && \
    git fetch origin && \
    git checkout ed7c2c65

# ── Custom Nodes ──────────────────────────────────────────────────────────────

# 1. ComfyUI-KJNodes
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/kijai/ComfyUI-KJNodes && \
    cd ComfyUI-KJNodes && \
    pip install -r requirements.txt --break-system-packages

# 2. ComfyUI-VideoHelperSuite
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite && \
    cd ComfyUI-VideoHelperSuite && \
    pip install -r requirements.txt --break-system-packages

# 3. ComfyUI-S3-IO
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/olduvai-jp/ComfyUI-S3-IO && \
    cd ComfyUI-S3-IO && \
    pip install -r requirements.txt --break-system-packages

# 4. rgthree-comfy
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/rgthree/rgthree-comfy && \
    cd rgthree-comfy && \
    pip install -r requirements.txt --break-system-packages

# ── Model paths via Network Volume ────────────────────────────────────────────
COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
