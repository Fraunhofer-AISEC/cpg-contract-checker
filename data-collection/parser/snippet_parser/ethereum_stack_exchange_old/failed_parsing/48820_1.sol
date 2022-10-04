$ mkdir populus_workspace && cd populus_workspace
$ [~/populus_workspace] populus init
Created Directory: ./contracts
Created Example Contract: ./contracts/Greeter.sol
Created Directory: ./tests
Created Example Tests: ./tests/test_greeter.py
$ py.test --capture=fd tests/test_greeter.py -s --disable-pytest-warnings
==================================== test session starts =====================================
platform darwin -- Python 2.7.10, pytest-3.5.0, py-1.5.3, pluggy-0.6.0
rootdir: /Users/alper/mu, inifile:
plugins: populus-2.0.1
collected 2 items

tests/test_greeter.py ..

============================ 2 passed, 6 warnings in 0.82 seconds ============================
