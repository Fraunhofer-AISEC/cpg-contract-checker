C:\Users\danie\demos\brownie_fund_me>brownie run scripts\deploy.py --network rinkeby 
INFO: Could not find files for the given pattern(s).
Brownie v1.17.2 - Python development framework for Ethereum

BrownieFundMeProject is the active project.

Running 'scripts\deploy.py::main'...
Transaction sent: 0x3cbf0aec47c36be44b5637296ddb83955c016536608d19fd72055ba59df3af05
  Gas price: 1.200000032 gwei   Gas limit: 531117   Nonce: 54
  FundMe.constructor confirmed   Block: 10020242   Gas used: 482834 (90.91%)
  FundMe deployed at: 0xE584303CA3046884145E1d712571969c8334AeA2

  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 50, in main
    return_value, frame = run(
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\scripts.py", line 103, in run      
    return_value = f_locals[method_name](*args, **kwargs)
  File ".\scripts\deploy.py", line 31, in main
    deploy_fund_me()
  File ".\scripts\deploy.py", line 26, in deploy_fund_me
    fund_me = FundMe.deploy({"from": account}, publish_source=True)
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 528, in __call__    return tx["from"].deploy(
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\account.py", line 557, in deploy   
    contract.publish_source(deployed_contract, silent=silent)
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 338, in publish_source
    contract_info = self.get_verification_info()
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\contract.py", line 295, in get_verification_info
    self._flattener = Flattener(source_fp, self._name, remaps, compiler_settings)
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\flattener.py", line 30, in __init__    self.traverse(primary_source_fp)
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\flattener.py", line 71, in traverse    self.traverse(import_path)
  File "C:\Users\danie\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\project\flattener.py", line 50, in traverse    source = fp_obj.read_text()
  File "C:\Program, line line, in in
    with self.open(mode='r', encoding=encoding, errors=errors) as f:
  File "C:\Program, line line, in in
    return io.open(self, mode, buffering, encoding, errors, newline,
  File "C:\Program, line line, in in
    return self._accessor.open(self, flags, mode)
FileNotFoundError: [Errno 2] No such file or directory: 'C:\\Users\\danie\\demos\\brownie_fund_me\\contracts\\brownie-config.yaml'
