from flask import Flask, request
from flask_cors import CORS
import datetime

app = Flask(__name__)
CORS(app)  # <- ¡esto permite que cualquier origen haga peticiones!

@app.route('/log', methods=['POST'])
def log():
    data = request.get_json()
    timestamp = datetime.datetime.now().isoformat()
    with open("xss_logs.txt", "a") as f:
        f.write(f"--- {timestamp} ---\n")
        f.write(f"{data}\n\n")
    return '', 200

@app.route('/')
def index():
    return "Servidor XSS activo"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)