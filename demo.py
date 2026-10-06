"""Sample file to compare VS Code colors with PyCharm."""
import json
from dataclasses import dataclass

MAX_RETRIES = 3  # a constant and a comment
def decorator(func):
    return func

@dataclass
class Placement:
    name: str
    floor: float = 0.25
    active: bool = True

    def __repr__(self) -> str:
        return f"Placement({self.name!r}, floor={self.floor})"

    @classmethod
    def from_json(cls, text: str) -> "Placement":
        data = json.loads(text)
        return cls(name=data["name"], floor=float(data.get("floor", 0.0)))

@decorator
def score(rows: list[dict], threshold: float = 0.5) -> int:
    total = 0
    for i, row in enumerate(rows):
        if row.get("bid", 0) > threshold and not row.get("skip"):
            total += 1
        elif i >= MAX_RETRIES:
            break
    print(len(rows), total, None, sep=" | ")
    return total

if __name__ == "__main__":
    p = Placement.from_json('{"name": "home", "floor": 1.5}')
    print(p, score([{"bid": 0.7}, {"bid": 0.2, "skip": True}]))
