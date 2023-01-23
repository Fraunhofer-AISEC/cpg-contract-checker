Brownie v1.19.0 - Python development framework for Ethereum
SmartcontractLotteryProject is the active project.
  File "brownie/_cli/__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "brownie/_cli/run.py", line 45, in main
    network.connect(CONFIG.argv["network"])
  File "brownie/network/main.py", line 31, in connect
    active = CONFIG.set_active_network(network)
  File "brownie/_config.py", line 74, in set_active_network
    id_ = self.settings["networks"]["default"]
TypeError: string indices must be integers
