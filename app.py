from flask import Flask, render_template
from datetime import datetime
import os

app = Flask(__name__)

@app.route('/')
def show_time():
    return render_template('clock.html',
        current_time=datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        timezone=os.getenv('TZ', 'UTC')
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))