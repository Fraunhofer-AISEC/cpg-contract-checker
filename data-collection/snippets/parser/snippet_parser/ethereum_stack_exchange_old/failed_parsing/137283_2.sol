Brownie v1.19.1 - Python development framework for Ethereum

LotteryProject is the active project.

Launching 'ganache-cli --accounts 10 --hardfork istanbul --gasLimit 12000000 --mnemonic brownie --port 8545'...

Running 'scripts/deploy.py::main'...
Transaction sent: 0x15a1a403628fb0dca6a972c95ec1633da0fdaffe2d0074148bfc0142ba993a0d
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  Lottery.constructor confirmed   Block: 1   Gas used: 267693 (2.23%)
  Lottery deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

contract deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87
type: <ContractCall 'getEntranceFee()'>
  File "brownie/_cli/run.py", line 51, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 110, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/deploy.py", line 4, in main
    deploy()
  File "./scripts/deploy.py", line 14, in deploy
    print("fee:",lottery.getEntranceFee())
  File "brownie/network/multicall.py", line 115, in _proxy_call
    result = ContractCall.__call__(*args, **kwargs)  # type: ignore
  File "brownie/network/contract.py", line 1902, in __call__
    return self.call(*args, block_identifier=block_identifier, override=override)
  File "brownie/network/contract.py", line 1693, in call
    raise VirtualMachineError(e) from None
VirtualMachineError: revert
Terminating local RPC client...
