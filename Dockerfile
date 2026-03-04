FROM runpod/worker-v1-vllm:stable-cuda12.1.0
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir git+https://github.com/huggingface/transformers.git
