brownie compile
INFO: Could not find files for the given pattern(s).
Brownie v1.16.4 - Python development framework for Ethereum

  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\_cli\__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\_cli\compile.py", line 50, in main
    proj = project.load()
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\main.py", line 750, in load
    return Project(name, project_path)
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\main.py", line 182, in __init__
    self.load()
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\main.py", line 237, in load
    self._compile(changed, self._compiler_config, False)
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\main.py", line 94, in _compile
    build_json = compiler.compile_and_format(
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\compiler\__init__.py", line 132, in compile_and_format
    input_json = generate_input_json(
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\compiler\__init__.py", line 190, in generate_input_json
    input_json["settings"]["remappings"] = _get_solc_remappings(remappings)
  File "C:\Users\scs\AppData\Local\Programs\Python\Python310\lib\site-packages\brownie\project\compiler\__init__.py", line 206, in _get_solc_remappings
    remap_dict = dict([remappings.split("=")])
ValueError: dictionary update sequence element #0 has length 1; 2 is required
