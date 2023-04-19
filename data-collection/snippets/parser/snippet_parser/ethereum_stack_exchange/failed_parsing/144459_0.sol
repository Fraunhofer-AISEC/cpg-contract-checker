PS C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle> node Oracle.js
C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle\utils\common.js:8
  const privateKey = CryptoUtils.B64ToUint8Array(privateKeyStr)
                                 ^

TypeError: Cannot read properties of undefined (reading 'B64ToUint8Array')
    at Object.loadAccount (C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle\utils\common.js:8:34)
    at init (C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle\Oracle.js:81:51)
    at C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle\Oracle.js:88:58
    at Object.<anonymous> (C:\Users\VidhanMangla\Desktop\mqube-blockchain-oracle\Oracle.js:97:3)
    at Module._compile (node:internal/modules/cjs/loader:1218:14)
    at Module._extensions..js (node:internal/modules/cjs/loader:1272:10)
    at Module.load (node:internal/modules/cjs/loader:1081:32)
    at Module._load (node:internal/modules/cjs/loader:922:12)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:81:12)
    at node:internal/main/run_main_module:23:47
