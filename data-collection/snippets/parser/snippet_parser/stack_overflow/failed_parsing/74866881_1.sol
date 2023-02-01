Brownie v1.18.1 - Python development framework for Ethereum

ContractProject is the active project.

Running 'scripts\call_contract.py::main'...
testing
The active network is polygon-test
  File "C:\Users\hello\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 51, in main
    return_value, frame = run(
  File "C:\Users\hello\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\call_contract.py", line 11, in main
    usdt = Contract(POLYGON_USDT)
  File "C:\Users\hello\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 879, in __init__
    raise ValueError(f"Unknown contract address: '{address}'")
ValueError: Unknown contract address: '0x28e0d6c548F51D41c4677151C3a06eC508235278'
