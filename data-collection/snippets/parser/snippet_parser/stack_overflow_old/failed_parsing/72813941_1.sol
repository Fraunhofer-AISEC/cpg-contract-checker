brownie run scripts/run_flashloan.py --network kovan
Brownie v1.17.2 - Python development framework for Ethereum

UpdatedVersionProject is the active project.

Running 'scripts/run_flashloan.py::main'...
0x4a8e4183709bb59E0807D64E46cFe7747479d371
Getting the flashloan contract for ya!
Contract properly funded...Executing flashloan...Be Patient!!
Transaction sent: 0x052373f6fcfd9eae451e8bd25648dc9e7fef268ce87c7bf561d1e9972541a802
  Gas price: 2.500000007 gwei   Gas limit: 20000000   Nonce: 87
  Flashloan_logic.userFlashloan confirmed (reverted)   Block: 32469346   Gas used: 57005 (0.29%)

  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/_cli/run.py", line 50, in main
    return_value, frame = run(
  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/project/scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/run_flashloan.py", line 28, in main
    tx = flashloan.userFlashloan(
  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/network/contract.py", line 1629, in __call__
    return self.transact(*args)
  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/network/contract.py", line 1502, in transact
    return tx["from"].transfer(
  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/network/account.py", line 682, in transfer
    receipt._raise_if_reverted(exc)
  File "/usr/local/lib/python3.8/dist-packages/eth_brownie-1.17.2-py3.8.egg/brownie/network/transaction.py", line 428, in _raise_if_reverted
    raise exc or ValueError("Execution reverted")
ValueError: Execution reverted
