   √ deploys a contract
    1) allows account to enter


  1 passing (318ms)
  1 failing

  1) Inbox
       allows account to enter:
     i: VM Exception while processing transaction: revert
      at Function.i.fromResults (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\lib\utils\runtimeerror.js:91:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\lib\blockchain_double.js:539:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\internal\once.js:12:1
      at p (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\internal\eachOfLimit.js:61:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\internal\eachOfLimit.js:71:1
      at a.default (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\eachLimit.js:43:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\internal\doLimit.js:9:1
      at v.r.emit (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async-eventemitter\lib\AsyncEventEmitter.js:42:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\runBlock.js:52:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\runBlock.js:174:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\cache.js:110:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:473:1
      at d (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:1006:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:1016:1
      at Da (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:3196:1)
      at Object.<anonymous> (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:1046:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\cache.js:106:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:969:1
      at n (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:5225:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\cache.js:103:1
      at n (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:5223:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\cache.js:103:1
      at n (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\async\dist\async.js:5223:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\ethereumjs-vm\dist\cache.js:98:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\merkle-patricia-tree\util.js:51:1
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\merkle-patricia-tree\node_modules\async\lib\async.js:52:1
      at f (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\merkle-patricia-tree\node_modules\async\lib\async.js:246:1)
      at C:\Users\tharindusa\Desktop\slv\node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\merkle-patricia-tree\node_modules\async\lib\async.js:44:1
      at Immediate._onImmediate (node_modules\ganache-cli\build\webpack:\ganache\node_modules\ganache-core\node_modules\levelup\lib\levelup.js:286:20)



npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! inbox@1.0.0 test: `mocha`
npm ERR! Exit status 1
npm ERR!
npm ERR! Failed at the inbox@1.0.0 test script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     C:\Users\tharindusa\AppData\Roaming\npm-cache\_logs\2018-09-04T05_52_38_807Z-debug.log
