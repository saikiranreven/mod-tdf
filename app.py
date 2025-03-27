from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Cloud Run!"

if __name__ == '__main__':
    # Use GUNICORN_PORT with fallback
    app.run(host='0.0.0.0', port=int(os.environ.get('GUNICORN_PORT', 8080)))