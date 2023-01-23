Transaction sent: 0x012c6bde69d8233b74e5a3524b058b565bb514793a8d53508139291844a39b98
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  SimpleStorage.constructor confirmed   Block: 1   Gas used: 338038 (2.82%)
  SimpleStorage deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

  SimpleStorage.constructor confirmed   Block: 1   Gas used: 338038 (2.82%)
  SimpleStorage deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

  File "C:\Users\dhaka\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 51, in main
    return_value, frame = run(
  File "C:\Users\dhaka\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "/1.Coding/Python/brownie_simple_storage/scripts/deploy.py", line 15, in main
    deploy_simple_storage()
  File "/1.Coding/Python/brownie_simple_storage/scripts/deploy.py", line 7, in deploy_simple_storage
    stored_value =simple_storage.retrieve()
AttributeError: 'NoneType' object has no attribute 'retrieve'
Terminating local RPC client...
