PS C:\Users\nstei\Git Repos\my-frist-brownie-project> brownie run .\scripts\deploy.py
INFO: Could not find files for the given pattern(s).  
Brownie v1.14.6 - Python development framework for Ethereum

Compiling contracts...  
  Solc version: 0.7.3  
  Optimizer: Enabled  Runs: 200  
  EVM Version: Istanbul  
Generating build data...  
 - MyFirstContract  

MyFristBrownieProject is the active project.

Launching 'ganache-cli.cmd --port 8545 --gasLimit 12000000 --accounts 10 --hardfork istanbul --mnemonic brownie'...  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\__main__.py", line 64, in main  
    importlib.import_module(f"brownie._cli.{cmd}").main()  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\_cli\run.py", line 43, in main
    network.connect(CONFIG.argv["network"])  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\main.py", line 50, in connect
    rpc.launch(active["cmd"], **active["cmd_settings"])  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\rpc\__init__.py", line 77, in launch
    self.process = self.backend.launch(cmd, **kwargs)  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\brownie\network\rpc\ganache.py", line 73, in launch
    return psutil.Popen(cmd_list, stdin=DEVNULL, stdout=out, stderr=out)  
  File "c:\users\nstei\.local\pipx\venvs\eth-brownie\lib\site-packages\psutil\__init__.py", line 1312, in __init__
    self.__subproc = subprocess.Popen(*args, **kwargs)  
  File "C:\Python39\lib\subprocess.py", line 951, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,  
  File "C:\Python39\lib\subprocess.py", line 1420, in _execute_child
    hp, ht, pid, tid = _winapi.CreateProcess(executable, args,  
FileNotFoundError: [WinError 2] The system cannot find the file specified
