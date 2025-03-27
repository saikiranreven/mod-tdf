FROM python:3.9-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Use GUNICORN_PORT instead of PORT
ENV GUNICORN_PORT=8080
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:$GUNICORN_PORT app:app"]