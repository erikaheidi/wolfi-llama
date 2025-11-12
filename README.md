# wolfi-llama
A container image based on Wolfi OS for running OSS LLMs via llama.cpp

## Usage
Download `.gguf` models from [huggingface](https://huggingface.co/) and place them in the `models` folder. Then run the image using a volume to share the models and a port redirect (for the server).

### Example: Running Qwen3 VL with a web chat interface (personal assistant like ChatGPT)

Build the Image

```bash
docker build . -t llama-test
```

Run the image with default entrypoint (llama-server) on port `8000` and create a port redirect so you can access it from your local network:

```bash
docker run --rm --device /dev/dri/card1 --device /dev/dri/renderD128 -v ${PWD}/models:/models -p 8000:8000 llama-test:latest --no-mmap --no-warmup -m /models/Qwen3-VL-2B-Instruct-Q8_0.gguf --mmproj /models/mmproj-F32.gguf --port 8000 --host 0.0.0.0 -n 512
```
