Downloading from https:
100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████| 38.4M/38.4M [00:49<00:00, 784kiB/s]
  File "brownie/_cli/__main__.py", line 64, in main
    importlib.import_module(f"brownie._cli.{cmd}").main()
  File "brownie/_cli/compile.py", line 50, in main
    proj = project.load()
  File "brownie/project/main.py", line 768, in load
    return Project(name, project_path)
  File "brownie/project/main.py", line 188, in __init__
    self.load()
  File "brownie/project/main.py", line 245, in load
    self._compile(changed, self._compiler_config, False)
  File "brownie/project/main.py", line 100, in _compile
    build_json = compiler.compile_and_format(
  File "brownie/project/compiler/__init__.py", line 105, in compile_and_format
    find_solc_versions(solc_sources, install_needed=True, silent=silent)
  File "brownie/project/compiler/solidity.py", line 173, in find_solc_versions
    install_solc(*to_install)
  File "brownie/project/compiler/solidity.py", line 105, in install_solc
    solcx.install_solc(version, show_progress=True)
  File "solcx/install.py", line 466, in install_solc
    raise exc
  File "solcx/install.py", line 459, in install_solc
    _validate_installation(version, solcx_binary_path)
  File "solcx/install.py", line 636, in _validate_installation
    raise SolcInstallationError(
SolcInstallationError: Downloaded binary would not execute, or returned unexpected output. If this issue persists, you can try to compile from source code using `solcx.compile_solc('0.8.14')`.
