# Instalação

Venv (opcional)

```bash
python -m venv venv
source venv/bin/activate
```

Para instalar as dependências, execute:

```bash
pip install -r requirements.txt
```

# Execução
Para executar o servidor, use:

```bash
uvicorn src.run:app --reload
```