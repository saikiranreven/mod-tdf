FROM python:3.9-slim

ENV TZ=America/Toronto

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Use port 5000 instead of 8080
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]