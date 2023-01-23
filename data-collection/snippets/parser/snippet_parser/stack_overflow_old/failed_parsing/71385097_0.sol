    Brownie v1.18.1 - Python development framework for Ethereum

BrownieSimpleStorageProject is the active project.

Running 'scripts\deploy.py::main'...
  File "C:\Users\jorge\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\site-packages\brownie\_cli\run.py", line 51, in main
    return_value, frame = run(
  File "C:\Users\jorge\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.9_qbz5n2kfra8p0\LocalCache\local-packages\Python39\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\deploy.py", line 25, in main
    deploy_simple_storage()
  File ".\scripts\deploy.py", line 5, in deploy_simple_storage
    account = get_account()
  File ".\scripts\deploy.py", line 21, in get_account
    return accounts.add(config["wallets"]["from_key"])
KeyError: 'wallets'
