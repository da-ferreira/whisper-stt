FROM python:3.13

# Diretório de trabalho dentro do container
WORKDIR /app

# Instalar ffmpeg e dependências básicas
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Copia requirements (se tiver)
COPY requirements.txt .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da API
COPY . .

# Expõe a porta (ajuste se não for 8880)
EXPOSE 8880

# Comando de inicialização (exemplo com FastAPI + uvicorn)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8880"]
