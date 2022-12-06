C:\Users\N\new\chainlink-mix>brownie run scripts/price_feed_scripts/01_deploy_price_consumer_v3.py
INFO: Could not find files for the given pattern(s).
Brownie v1.16.3 - Python development framework for Ethereum

ChainlinkMixProject is the active project.
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\_cli\__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\_cli\run.py", line 43, in main
    network.connect(CONFIG.argv["network"])
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\network\main.py", line 55, in connect
    p._load_deployments()
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\project\main.py", line 357, in _load_deployments
    contract = ProjectContract(self, build, build_json.stem)
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\network\contract.py", line 1292, in __init__
    _DeployedContractBase.__init__(self, address, owner, tx)
  File "C:\Users\N\AppData\Local\Programs\Python\Python39\lib\site-packages\brownie\network\contract.py", line 758, in __init__
    raise ContractNotFound(f"No contract deployed at {address}")
ContractNotFound: No contract deployed at 0xa1d97e44c6Ac5327DEa2deCAb5f9E1085b8Bcf38
