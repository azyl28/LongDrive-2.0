# Użyj lekkiej bazy Python
FROM python:3.11-slim

# Ustaw katalog roboczy
WORKDIR /app

# Skopiuj zależności
COPY requirements.txt .

# Zainstaluj pakiety
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj cały kod
COPY . .

# Uruchom aplikację (zmień na swój entrypoint)
CMD # albo jeśli FastAPI: CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
