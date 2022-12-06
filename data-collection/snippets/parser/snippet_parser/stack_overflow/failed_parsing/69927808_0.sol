PS C:\Users\chret\Documents\demo\brownie_simple_storage> brownie run scripts/deploy.py
INFO: Could not find files for the given pattern(s).
Brownie v1.17.1 - Python development framework for Ethereum

BrownieSimpleStorageProject is the active project.

Launching 'ganache-cli.cmd --port 8545 --gasLimit 12000000 --accounts 10 --hardfork istanbul --mnemonic brownie'...
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\brownie\_cli\__main__.py", line 64, in main
  importlib.import_module(f"brownie._cli.{cmd}").main()
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\brownie\_cli\run.py", line 44, in main
  network.connect(CONFIG.argv["network"])
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\brownie\network\main.py", line 50, in connect
  rpc.launch(active["cmd"], **active["cmd_settings"])
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\brownie\network\rpc\__init__.py", line 75, in launch
  self.process = self.backend.launch(cmd, **kwargs)
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\brownie\network\rpc\ganache.py", line 73, in launch
  return psutil.Popen(cmd_list, stdin=DEVNULL, stdout=out, stderr=out)
File "C:\Users\chret\AppData\Roaming\Python\Python39\site-packages\psutil\__init__.py", line 1312, in __init__
  self.__subproc = subprocess.Popen(*args, **kwargs)
File "C:\Program, line line, in in
  self._execute_child(args, executable, preexec_fn, close_fds,
File "C:\Program, line line, in in
  hp, ht, pid, tid = _winapi.CreateProcess(executable, args,
FileNotFoundError: [WinError 2] The system cannot find the file specified
