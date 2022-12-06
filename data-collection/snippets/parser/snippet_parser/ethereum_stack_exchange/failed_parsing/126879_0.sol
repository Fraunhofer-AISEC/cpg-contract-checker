(base) andrea@andrea-ThinkPad-S430:~/MEGA/smart_contracts/demos/ERC20-brownie$ brownie pm install OpenZeppelin/openzeppelin-contracts@4.5.0
Brownie v1.18.1 - Python development framework for Ethereum

  File "brownie/_cli/__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "brownie/_cli/pm.py", line 39, in main
    fn(*args["<arguments>"])
  File "brownie/_cli/pm.py", line 93, in _install
    package_id = project.main.install_package(uri)
  File "brownie/project/main.py", line 796, in install_package
    return _install_from_github(package_id)
  File "brownie/project/main.py", line 850, in _install_from_github
    raise FileExistsError("Package is aleady installed")
FileExistsError: Package is aleady installed

(base) andrea@andrea-ThinkPad-S430:~/MEGA/smart_contracts/demos/ERC20-brownie$ brownie compile
Brownie v1.18.1 - Python development framework for Ethereum

Compiling contracts...
  Solc version: 0.8.13
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
CompilerError: solc returned the following errors:

ParserError: Source "@openzeppelin/contracts/token/ERC721/ERC721.sol" not found: File not found. Searched the following locations: "".
 --> contracts/OurToken.sol:5:1:
  |
5 | import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
