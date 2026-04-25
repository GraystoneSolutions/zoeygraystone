FROM python:3.12-slim

WORKDIR /zoey/app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY main.py .

# Create PWA directory (will be volume-mounted or copied in)
RUN mkdir -p /zoey/pwa /zoey/logs /zoey/backups

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
