File "brownie/_cli/run.py", line 49, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/deploy_bcontract.py", line 39, in main
    bcontract = deploy_bcontract(account)
  File "./scripts/deploy_bcontract.py", line 8, in deploy_bet
    bcontract = BContract.deploy({"from": account}, publish_source=True)
  File "brownie/network/contract.py", line 600, in __call__
    return tx["from"].deploy(
  File "brownie/network/account.py", line 555, in deploy
    contract.publish_source(deployed_contract, silent=silent)
  File "brownie/network/contract.py", line 410, in publish_source
    contract_info = self.get_verification_info()
  File "brownie/network/contract.py", line 292, in get_verification_info
    if symbol_alias["local"] is not None:
KeyError: 'local'
