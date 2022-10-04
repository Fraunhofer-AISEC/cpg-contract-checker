  Solc version: 0.8.10
  Optimizer: Enabled  Runs: 200
  EVM Version: Istanbul
---------------------------------------------------------------------------
SolcError                                 Traceback (most recent call last)
~/pyenv/eth/lib/python3.8/site-packages/brownie/project/compiler/solidity.py in compile_from_input_json(input_json, silent, allow_paths)
     77     try:
---> 78         return solcx.compile_standard(input_json, allow_paths=allow_paths)
     79     except solcx.exceptions.SolcError as e:

~/pyenv/eth/lib/python3.8/site-packages/solcx/main.py in compile_standard(input_data, base_path, allow_paths, output_dir, overwrite, solc_binary, solc_version, allow_empty)
    393             )
--> 394             raise SolcError(
    395                 error_message,

SolcError: ParserError: Source "/home/my_username/.brownie/packages/contracts/ContractA.sol" not found: File not found.
 --> contracts/ContractB.sol:4:1:
  |
4 | import "./ContractA.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^


> command: `/home/my_username/.solcx/solc-v0.8.10 --standard-json --allow-paths /home/my_username/test_case,/home/my_username/.brownie/packages`
> return code: `0`
> stdout:
{"errors":[{"component":"general","errorCode":"6275","formattedMessage":"ParserError: Source \"/home/my_username/.brownie/packages/contracts/ContractA.sol\" not found: File not found.\n --> contracts/ContractB.sol:4:1:\n  |\n4 | import \"./ContractA.sol\";\n  | ^^^^^^^^^^^^^^^^^^^^^^^^^\n\n","message":"Source \"/home/my_username/.brownie/packages/contracts/ContractA.sol\" not found: File not found.","severity":"error","sourceLocation":{"end":82,"file":"contracts/ContractB.sol","start":57},"type":"ParserError"}],"sources":{}}

> stderr:

During handling of the above exception, another exception occurred:

CompilerError                             Traceback (most recent call last)
<ipython-input-4-086384e98c33> in <module>
----> 1 test_project = project.load(".")

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/main.py in load(project_path, name)
    749 
    750     # load sources and build
--> 751     return Project(name, project_path)
    752 
    753 

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/main.py in __init__(self, name, project_path)
    181         self._name = name
    182         self._active = False
--> 183         self.load()
    184 
    185     def load(self) -> None:

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/main.py in load(self)
    236         # compile updated sources, update build
    237         changed = self._get_changed_contracts(interface_hashes)
--> 238         self._compile(changed, self._compiler_config, False)
    239         self._compile_interfaces(interface_hashes)
    240         self._load_dependency_artifacts()

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/main.py in _compile(self, contract_sources, compiler_config, silent)
     93 
     94         try:
---> 95             build_json = compiler.compile_and_format(
     96                 contract_sources,
     97                 solc_version=compiler_config["solc"].get("version", None),

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/compiler/__init__.py in compile_and_format(contract_sources, solc_version, vyper_version, optimize, runs, evm_version, silent, allow_paths, interface_sources, remappings, optimizer)
    139         )
    140 
--> 141         output_json = compile_from_input_json(input_json, silent, allow_paths)
    142         build_json.update(generate_build_json(input_json, output_json, compiler_data, silent))
    143 

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/compiler/__init__.py in compile_from_input_json(input_json, silent, allow_paths)
    254     if input_json["language"] == "Solidity":
    255         allow_paths = _get_allow_paths(allow_paths, input_json["settings"]["remappings"])
--> 256         return solidity.compile_from_input_json(input_json, silent, allow_paths)
    257 
    258     raise UnsupportedLanguage(f"{input_json['language']}")

~/pyenv/eth/lib/python3.8/site-packages/brownie/project/compiler/solidity.py in compile_from_input_json(input_json, silent, allow_paths)
     78         return solcx.compile_standard(input_json, allow_paths=allow_paths)
     79     except solcx.exceptions.SolcError as e:
---> 80         raise CompilerError(e, "solc")
     81 
     82 

CompilerError: solc returned the following errors:

ParserError: Source "/home/my_username/.brownie/packages/contracts/ContractA.sol" not found: File not found.
 --> contracts/ContractB.sol:4:1:
  |
4 | import "./ContractA.sol";
  | ^^^^^^^^^^^^^^^^^^^^^^^^^
