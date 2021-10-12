from flask import Flask
import os
app = Flask(__name__)
@app.route("/")

def hello():
    application_type = os.environ['APP_TYPE']
    hostname = os.environ['HOSTNAME']
    application_version = os.environ['APP_VERSION']
    return "Hello " + application_type + " ! " + application_version + " - " + hostname
#    return "Hello"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
