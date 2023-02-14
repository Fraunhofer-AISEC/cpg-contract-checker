Brownie v1.18.2 - Python development framework for Ethereum

BrownieFundMeProject is the active project.

Running 'scripts/fund_and_withdraw.py::main'...
  File "brownie/_cli/run.py", line 51, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 110, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/fund_and_withdraw.py", line 13, in main
    fund()
  File "./scripts/fund_and_withdraw.py", line 8, in fund
    entrance_fee = fund_me.getEntranceFee()
  File "brownie/network/multicall.py", line 115, in _proxy_call
    result = ContractCall.__call__(*args, **kwargs)  # type: ignore
  File "brownie/network/contract.py", line 1902, in __call__
    return self.call(*args, block_identifier=block_identifier, override=override)
  File "brownie/network/contract.py", line 1693, in call
    raise VirtualMachineError(e) from None
  File "brownie/exceptions.py", line 106, in __init__
    raise ValueError(f"{self.message}: {err_msg}") from None
ValueError: VM Exception while processing transaction: revert: 
