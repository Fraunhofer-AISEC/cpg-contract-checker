$ brownie run deploy.py --network mainnet-fork-dev
INFO: Could not find files for the given pattern(s).
Brownie v1.16.4 - Python development framework for Ethereum

BrownieFundMeProject is the active project.
C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\network\main.py:44: BrownieEnvironmentWarning: Development network has a block height of 114
  warnings.warn(
Attached to local RPC client listening at '127.0.0.1:8545'...

Running 'scripts\deploy.py::main'...
account used is  0xFF3c899C61625bF772bA029C50D27E33db52f2D9
Transaction sent: 0xbb0c1ab97868e2851a586fddd4b64d23ec317dbba05efd35ff9fe04e03f54e3a
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 106
  FundMe.constructor confirmed   Block: 115   Gas used: 515717 (4.30%)
  FundMe deployed at: 0x948E3BA0dE6FADCE5e1459F5432A48Ef3DC7F70b

contract deployed to  0x948E3BA0dE6FADCE5e1459F5432A48Ef3DC7F70b
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\_cli\run.py", line 49, 
in main
    return_value, frame = run(
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\deploy.py", line 32, in main
    deploy_fund_me()
  File ".\scripts\deploy.py", line 27, in deploy_fund_me
    print("entree fee is ", fund_me.getEntranceFee())
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\network\multicall.py", 
line 115, in _proxy_call
    result = ContractCall.__call__(*args, **kwargs)  # type: ignore
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\network\contract.py", line 1729, in __call__
    return self.call(*args, block_identifier=block_identifier)
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\network\contract.py", line 1533, in call
    raise VirtualMachineError(e) from None
  File "C:\Users\91989\AppData\Roaming\Python\Python310\site-packages\brownie\exceptions.py", line 104, in __init__
    raise ValueError(exc["message"]) from None
ValueError: VM Exception while processing transaction: revert
