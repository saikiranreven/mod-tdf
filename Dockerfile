# Use official Python runtime
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files
COPY . .

# Set environment variables
ENV PORT=8080
ENV TZ=UTC

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "app:app"]