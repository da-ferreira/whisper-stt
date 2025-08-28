FROM python:3.13

WORKDIR /app

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8880

CMD ["uvicorn", "src.run:app", "--host", "0.0.0.0", "--port", "8880"]
