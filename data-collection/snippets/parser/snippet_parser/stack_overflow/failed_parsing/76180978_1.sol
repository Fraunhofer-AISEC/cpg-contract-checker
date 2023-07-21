File "brownie/_cli/run.py", line 51, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 110, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/GetAgreementData.py", line 18, in main
    print(Agreement.testFunction(2))
  File "brownie/network/multicall.py", line 115, in _proxy_call
    result = ContractCall.__call__(*args, **kwargs)  # type: ignore
  File "brownie/network/contract.py", line 1902, in __call__
    return self.call(*args, block_identifier=block_identifier, override=override)
  File "brownie/network/contract.py", line 1693, in call
    raise VirtualMachineError(e) from None
VirtualMachineError: revert
