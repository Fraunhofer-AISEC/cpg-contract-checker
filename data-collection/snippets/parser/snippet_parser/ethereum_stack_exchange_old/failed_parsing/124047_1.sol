 brownie run .\scripts\fund_and_withdraw.py --network ganache-local
INFO: Could not find files for the given pattern(s).
Brownie v1.16.4 - Python development framework for Ethereum

BrownieFundMeProject is the active project.

Running 'scripts\fund_and_withdraw.py::main'...
  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\_cli\run.py", line 49, in main
    return_value, frame = run(
  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\project\scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\fund_and_withdraw.py", line 20, in main
    fund()
  File ".\scripts\fund_and_withdraw.py", line 13, in fund
    enterance_fee = fund_me.getEntranceFee()
  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\network\multicall.py", line 115, in _proxy_call
    result = ContractCall.__call__(*args, **kwargs)  # type: ignore
  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\network\contract.py", line 1729, in __call__
    return self.call(*args, block_identifier=block_identifier)
  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\network\contract.py", line 1539, in call
    raise ValueError("No data was returned - the call likely reverted")
ValueError: No data was returned - the call likely reverted
PS C:\Users\tayyi\Desktop\Blockchain\Patrick\brownie_fund_me> brownie run .\scripts\fund_and_withdraw.py --network ganache-local
INFO: Could not find files for the given pattern(s).
Brownie v1.16.4 - Python development framework for Ethereum

  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\network\contract.py", line 1729, in __call__
    return self.call(*args, block_identifier=block_identifier)  File "C:\Users\tayyi\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.10_qbz5n2kfra8p0\LocalCache\local-packages\Python310\site-packages\brownie\network\contract.py", line 1539, in call
    raise ValueError("No data was returned - the call likely reverted")ValueError: No data was returned - the call likely reverted
