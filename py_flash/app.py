from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, I am a Docker image running inside Azure AKS!"

@app.route("/healthz")
def health():
    # Add health check logic here
    # For example, check database connections, external service availability, etc.
    return "I am healthy!", 200

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(debug=True, host='0.0.0.0', port=port)

