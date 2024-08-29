from pydantic import BaseModel

class Scores(BaseModel):
    math_score :int
    aptitude_score: int
    science_score:int
    logical_score: int
    verbal_score: int