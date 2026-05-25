from flask import Flask # importing fram ework
import os # import os

app=Flask(__name__) 
# create instance of flask and assigning it to app
# __name___ points to the current file, flask needs a starting point

@app.route("/") # routing, root URL+``

def home():
    return { "messagge":"hello from flask", "version":"1.0"}
# return JSON at the root URL

@app.route("/health") # routing, health check URL
# this is a liveness probe
# kubernetes checks this to see if the pod is health, if it returns anything other than 200(OK), it restarts it

def health():
    return {"status": "OK"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

# 0.0.0.0 means listen to all network interfaces
# without this app only listens to inside the container and nothing from outside can reach it