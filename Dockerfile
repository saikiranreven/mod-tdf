FROM python:3.9-slim

RUN apt-get update && apt-get install -y tzdata
ENV TZ=America/Toronto
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# Use port 5000 instead of 8080
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]