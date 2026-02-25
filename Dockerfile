# Image officielle Python basée sur Alpine
FROM python:3.14-alpine

RUN apk add mariadb-client

# Empêche Python d'écrire des .pyc et force les logs en stdout
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Dépendances système minimales (souvent utiles pour wheels)
#RUN apk add --no-cache gcc musl-dev libffi-dev

# Installer les deps Python (cache-friendly)
# Option A: si tu as un requirements.txt
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code
COPY . /app

# Port exposé (info)
EXPOSE 8000

# Lancer l'app
# -> suppose que ton fichier s'appelle main.py et contient app = FastAPI()
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

