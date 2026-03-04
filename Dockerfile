FROM runpod/worker-v1-vllm:stable-cuda12.1.0
RUN pip install --no-cache-dir git+https://github.com/huggingface/transformers.git
