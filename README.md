# RunPod Worker vLLM - Custom (Qwen3.5 MoE Support)

Custom vLLM worker image for RunPod Serverless with updated `transformers` to support **Qwen3.5 MoE** architecture (`qwen3_5_moe`).

## Why?

RunPod's default vLLM images ship with an older `transformers` version that doesn't recognize the `qwen3_5_moe` architecture. This image upgrades transformers from the latest GitHub source.

## Deploy on RunPod

### Option 1: GitHub Integration
1. Connect this repo to RunPod (Serverless → New Endpoint → Connect GitHub)
2. Set environment variables:
   - `MODEL_NAME` = your HuggingFace model (e.g. `Qwen/Qwen3.5-35B-A3B`)
   - `HF_TOKEN` = your HuggingFace token (if private model)
   - `MAX_MODEL_LEN` = `32768` (or higher for H200)
3. Select GPU: **1x H100 80GB** or **1x H200**

### Option 2: Docker Registry
```bash
docker build -t YOUR_USER/vllm-qwen35:latest .
docker push YOUR_USER/vllm-qwen35:latest
```
Then use `YOUR_USER/vllm-qwen35:latest` as container image on RunPod.

## API Usage (OpenAI Compatible)
```python
from openai import OpenAI

client = OpenAI(
    api_key="RUNPOD_API_KEY",
    base_url="https://api.runpod.ai/v2/ENDPOINT_ID/openai/v1"
)

response = client.chat.completions.create(
    model="your-model-name",
    messages=[{"role": "user", "content": "Hello!"}]
)
```

## GPU Requirements (Qwen3.5-35B-A3B)

| Precision | VRAM  | GPU                  |
|-----------|-------|----------------------|
| BF16      | ~37GB | 1x H100 80GB / H200 |
| FP8       | ~20GB | 1x L40S 48GB        |
| Q4        | ~18GB | 1x RTX 4090 24GB    |
