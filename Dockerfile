FROM python:3.11-slim
WORKDIR /app
COPY pyproject.toml /app/

RUN pip install --no-cache-dir fastapi uvicorn pytest ruff httpx \
    && apt-get update && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
