# Install

## Nvidia toolkit for Docker

To setup Nvidia for Docker follow the instructions here: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

## Example files

Use the shared compose example plus a backend-specific env example:

- Compose: `docker-compose.example.yml`
- Nvidia CUDA env: `.env.nvidia.example`
- AMD ROCm env: `.env.rocm.example`

## Ollama backend and version

Set these values in `.env` before running `docker compose up`:

```env
COMPOSE_PROFILES=nvidia
OLLAMA_TAG=0.18.2
OLLAMA_DATA_DIR=./ollama
OLLAMA_CONTEXT_LENGTH=32000
```

Use `COMPOSE_PROFILES=nvidia` for Nvidia or `COMPOSE_PROFILES=rocm` for AMD ROCm.

Nvidia uses `ollama/ollama:${OLLAMA_TAG}` and ROCm uses `ollama/ollama:${OLLAMA_TAG}-rocm`.

The Ollama data directory bind mount is configured by `OLLAMA_DATA_DIR` and mounts to `/root/.ollama` in the container.

The compose setup now exposes whichever Ollama service is active on the same hostname: `http://ollama:11434`

ROCm requires access to `/dev/kfd` and `/dev/dri`.

Stable Diffusion is profile-gated too. `nvidia` uses `ghcr.io/ai-dock/stable-diffusion-webui:latest-cuda` and `rocm` uses `ghcr.io/ai-dock/stable-diffusion-webui:latest-rocm`.

## Stable Diffusion in OpenWebUI

After running `docker compose up` initially, shut it off and run this command:

```bash
chmod 777 stable-diffusion/models/
```

Click username in bottom left corner -> Admin panel -> Images.

Enter the following.

```
URL: http://stable-diffusion-webui:7860
Api Auth String: The username and password combination set in the .env file.
```
