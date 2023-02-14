 node deploy.js
attempting to deploy from account 0x010Ff624891610c8538824AB6F5AF4abfD1c3bfd
Enter gas-price or leave empty to use 1000000000: 1050000000
Error: Transaction was not mined within 750 seconds, please make sure your transaction was properly sent. Be aware that it might still be mined!
Error: Transaction was not mined within 750 seconds, please make sure your transaction was properly sent. Be aware that it might still be mined!
C:\Users\Ketan Verma\Desktop\blockchain\solidity-etherium\index\node_modules\solc\soljson.js:1
(function (exports, require, module, __filename, __dirname) { "use strict";var Module=typeof Module!=="undefined"?Module:{};var moduleOverrides={};var key;for(key in
Module){if(Module.hasOwnProperty(key)){moduleOverrides[key]=Module[key]}}var arguments_=[];var thisProgram="./this.program";var quit_=function(status,toThrow){throw toThrow};var ENVIRONMENT_IS_WEB=false;var ENVIRONMENT_IS_WORKER=false;var ENVIRONMENT_IS_NODE=false;var ENVIRONMENT_HAS_NODE=false;var ENVIRONMENT_IS_SHELL=false;ENVIRONMENT_IS_WEB=typeof window==="object";ENVIRONMENT_IS_WORKER=typeof importScripts==="function";ENVIRONMENT_HAS_NODE=typeof process==="object"&&typeof process.versions==="object"&&typeof process.versions.node==="string";ENVIRONMENT_IS_NODE=ENVIRONMENT_HAS_NODE&&!ENVIRONMENT_IS_WEB&&!ENVIRONMENT_IS_WORKER;ENVIRONMENT_IS_SHELL=!ENVIRONMENT_IS_WEB&&!ENVIRONMENT_IS_NODE&&!ENVIRONMENT_IS_WORKER;var scriptDirectory="";function locat

RuntimeError: abort(Error: Transaction was not mined within 750 seconds, please make sure your transaction was properly sent. Be aware that it might still be mined!). Build with -s ASSERTIONS=1 for more info.
    at process.abort (C:\Users\Ketan Verma\Desktop\blockchain\solidity-etherium\index\node_modules\solc\soljson.js:1:14506)
    at process.emit (events.js:189:13)
    at emitPromiseRejectionWarnings (internal/process/promises.js:119:20)
    at process._tickCallback (internal/process/next_tick.js:69:34)
