from typing import Optional
from pydantic import BaseModel
from fastapi import FastAPI

app = FastAPI()


class Features(BaseModel):
    text: str
    link: str


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.post("/predict")
async def predict(features: Features):
    data = features.dict()
    print(data)
    return 0
