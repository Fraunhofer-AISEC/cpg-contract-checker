Updated: See error below ->
Running 'scripts/deploy.py::main'...
  File "brownie/_cli/run.py", line 51, in main
    return_value, frame = run(
  File "brownie/project/scripts.py", line 110, in run
    return_value = f_locals[method_name](*args, **kwargs)
  File "./scripts/deploy.py", line 48, in main
    deploy_turtles()
  File "./scripts/deploy.py", line 13, in deploy_turtles
    turtle_deployed = Turtles.deploy(
  File "brownie/network/contract.py", line 549, in __call__
    return tx["from"].deploy(
  File "brownie/network/account.py", line 509, in deploy
    data = contract.deploy.encode_input(*args)
  File "brownie/network/contract.py", line 579, in encode_input
    data = format_input(self.abi, args)
  File "brownie/convert/normalize.py", line 20, in format_input
    raise type(e)(f"{abi['name']} {e}") from None
ValueError: constructor '['0x4a40E425a8D1EE6279f860d8fd5db3D3661558d6', '0xa9873c4c5FBd0196d0fbA2e50a3eEe216C4D6780']' - '['0x4a40E425a8D1EE6279f860d8fd5db3D3661558d6', '0xa9873c4c5FBd0196d0fbA2e50a3eEe216C4D6780']' is not a valid ETH address
