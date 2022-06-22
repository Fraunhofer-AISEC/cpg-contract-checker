Running 'scripts/deploy.py::main'...
  File "brownie/_cli/run.py", line 50, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 103, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/deploy.py", line 12, in main
    deploy_fund_me()
  File "./scripts/deploy.py", line 7, in deploy_fund_me
    fund_me = FundMe.deploy({"from:account"}, publish_source=True)
  File "brownie/network/contract.py", line 523, in _call_
    raise AttributeError(
AttributeError: Final argument must be a dict of transaction parameters that includes a `from` field specifying the address to deploy from
