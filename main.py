from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def root():
    return "<h1>Hello World 😀😀</h1>"

@app.get("/ping")
def ping():
     return {"pong": True}

@app.get("/pong")
def ping():
     return {"ping": True}

@app.get("/tutu", response_class=HTMLResponse)
def root():
    return "<h1>Hello tutu 😀😀</h1>"


