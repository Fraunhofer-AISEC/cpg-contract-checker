(base) liwei@liweideMacBook-Pro Brownie_Simple_Storage % brownie run tests/test_simple_storage.py
Brownie v1.17.2 - Python development framework for Ethereum

BrownieSimpleStorageProject is the active project.
Attached to local RPC client listening at '127.0.0.1:8545'...
  File "brownie/_cli/__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "brownie/_cli/run.py", line 46, in main
    path, _ = _get_path(args["<filename>"])
  File "brownie/project/scripts.py", line 130, in _get_path
    raise FileNotFoundError(f"Cannot find {path_str}")
FileNotFoundError: Cannot find tests/test_simple_storage.py
(base) liwei@liweideMacBook-Pro Brownie_Simple_Storage % 


