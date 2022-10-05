(env) (base) liwei@liweideMacBook-Pro practice % python3 deploy.py
Traceback (most recent call last):
  File "deploy.py", line 10, in <module>
    compiled_sol = compile_standard(
  File "/Users/liwei/Desktop/demos/practice/env/lib/python3.8/site-packages/solcx/main.py", line 375, in compile_standard
    stdin=json.dumps(input_data),
  File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/json/__init__.py", line 231, in dumps
    return _default_encoder.encode(obj)
  File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/json/encoder.py", line 199, in encode
    chunks = self.iterencode(o, _one_shot=True)
  File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/json/encoder.py", line 257, in iterencode
    return _iterencode(o, 0)
  File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/json/encoder.py", line 179, in default
    raise TypeError(f'Object of type {o.__class__.__name__} '
TypeError: Object of type set is not JSON serializable
