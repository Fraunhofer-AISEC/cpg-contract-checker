PS C:\tai_jutsu\Learn_crypto\brownie> brownie run .\scripts\deploy.py --network ropsten
INFO: Could not find files for the given pattern(s).
Brownie v1.18.1 - Python development framework for Ethereum

BrownieProject is the active project.
  File "C:\users\jayendra\appdata\local\programs\python\python39\lib\site-packages\brownie\_cli\run.py", line 51, in main
    return_value, frame = run(
  File "C:\users\jayendra\appdata\local\programs\python\python39\lib\site-packages\brownie\project\scripts.py", line 53, in run
    module = _import_from_path(script)
  File "C:\users\jayendra\appdata\local\programs\python\python39\lib\site-packages\brownie\project\scripts.py", line 149, in _import_from_path
    _import_cache[import_str] = importlib.import_module(import_str)
  File "C:\users\jayendra\appdata\local\programs\python\python39\lib\importlib\__init__.py", line 127, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen, line line, in in
  File "<frozen, line line, in in
  File "<frozen, line line, in in
  File "<frozen, line line, in in
  File "<frozen, line line, in in
  File "<frozen, line line, in in
  File "\tai_jutsu\Learn_crypto\brownie\scripts\deploy.py", line 1, in <module>
    from brownie import Fundme, accounts, network, config
ImportError: cannot import name 'Fundme' from 'brownie' (C:\users\jayendra\appdata\local\programs\python\python39\lib\site-packages\brownie\__init__.py)  ```

what am i doing wrong 

I tried installing brownie with pipx and pip none of them worked for me 
