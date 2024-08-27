from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def home_route():
    return {"details": "Hello World"}
