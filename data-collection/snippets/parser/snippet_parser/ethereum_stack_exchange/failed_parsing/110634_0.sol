File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 256, in locate_app
    __import__(module_name)
  File "/Users/work/Documents/OpenvinoNFT/app/api/api.py", line 2, in <module>
    from create_collectible import main, nftcode
  File "/Users/work/Documents/OpenvinoNFT/app/api/create_collectible.py", line 4, in <module>
    from brownie import SimpleCollectible, account, network, config
ImportError: cannot import name 'SimpleCollectible' from 'brownie' (/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/brownie/__init__.py)

Traceback (most recent call last)
File "/Users/work/Documents/OpenvinoNFT/app/api/api.py", line 2, in <module>
from create_collectible import main, nftcode
File "/Users/work/Documents/OpenvinoNFT/app/api/create_collectible.py", line 4, in <module>
from brownie import SimpleCollectible, account, network, config
During handling of the above exception, another exception occurred:
File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 359, in __call__
rv = self._load_unlocked()
File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 346, in _load_unlocked
self._app = rv = self.loader()
File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 402, in load_app
app = locate_app(self, import_name, name)
File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 261, in locate_app
raise NoAppException(
flask.cli.NoAppException: While importing 'api', an ImportError was raised:

Traceback (most recent call last):
File "/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/flask/cli.py", line 256, in locate_app
__import__(module_name)
File "/Users/work/Documents/OpenvinoNFT/app/api/api.py", line 2, in <module>
from create_collectible import main, nftcode
File "/Users/work/Documents/OpenvinoNFT/app/api/create_collectible.py", line 4, in <module>
from brownie import SimpleCollectible, account, network, config
ImportError: cannot import name 'SimpleCollectible' from 'brownie' (/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/brownie/__init__.py)
