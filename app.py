from flask import Flask, render_template
from datetime import datetime
import os
import pytz

app = Flask(__name__)

@app.route('/')
def show_time():
    toronto_time = datetime.now(pytz.timezone('America/Toronto'))
    return render_template('index.html',
        current_time=toronto_time.strftime("%H:%M:%S")
    )

if __name__ == '__main__':
    # Updated to use port 5000
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))