# Installation (local)

Venv (optional)

```bash
python -m venv venv
source venv/bin/activate
```

To install the dependencies, run:

```bash
pip install -r requirements.txt
```

To run the server, use:

```bash
uvicorn src.run:app --reload
```

# Running with Docker (GHCR)

```bash
docker run -p 8880:8880 ghcr.io/da-ferreira/whisper-stt:latest
```

and then use stt endpoint (any audio type)

```bash
curl -X POST "http://localhost:8880/stt" \
  -H "Content-Type: multipart/form-data" \
  -F "audio=@/path/to/your/file.mp3"
```
