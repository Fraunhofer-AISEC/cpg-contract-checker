  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 41, in main
    active_project = project.load()
  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\main.py", line 768, in load
    return Project(name, project_path)
  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\main.py", line 188, in __init__
    self.load()
  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\main.py", line 245, in load
    self._compile(changed, self._compiler_config, False)
  File "C:\Users\ollie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\main.py", line 127, in _compile
    json.dump(data, fp, sort_keys=True, indent=2, default=sorted)
  File "C:\Program, line line, in in
    for chunk in iterable:
  File "C:\Program, line line, in in
    yield from _iterencode_dict(o, _current_indent_level)
  File "C:\Program, line line, in in
    yield from chunks
  File "C:\Program, line line, in in
    yield from chunks
  File "C:\Program, line line, in in
    yield from chunks
  File "C:\Program, line line, in in
    items = sorted(dct.items())
TypeError: '<' not supported between instances of 'str' and 'NoneType'
