#!/usr/bin/python3
import json

d = dict(name='Juhezi', age=20, score=88)
result = json.dumps(d)
print("Json 数据： ", result)

json_str = '{"age": 20, "score": 88, "name": "Bob"}'
data = json.loads(json_str)
print("Python 对象： ", data)

