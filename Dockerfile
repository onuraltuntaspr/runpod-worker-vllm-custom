FROM runpod/worker-vllm:v2.5.0stable-cuda12.1.0
RUN pip install --no-cache-dir git+https://github.com/huggingface/transformers.git
