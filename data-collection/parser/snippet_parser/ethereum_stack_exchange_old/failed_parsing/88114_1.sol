use experimental features on live deployments.
pragma experimental ABIEncoderV2;
^-------------------------------^

IEIP1271.sol:13:3: TypeError: Function overload clash during conversion to external types for arguments.
  function isValidSignature(
  ^ (Relevant source part starts here and spans across multiple lines).

generated/ReentrancyGuard.sol:34:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
                          ^---------------^

generated/ReentrancyGuard.sol:46:40: TypeError: Constant variables not supported by inline assembly.
        assembly { notEntered := sload(LOCK_FLAG_ADDRESS) }
                                       ^---------------^

generated/ReentrancyGuard.sol:52:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 0) }
                          ^---------------^

generated/ReentrancyGuard.sol:58:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
                          ^---------------^

dev-contracts/generated/ReentrancyGuard.sol:34:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
                          ^---------------^

dev-contracts/generated/ReentrancyGuard.sol:46:40: TypeError: Constant variables not supported by inline assembly.
        assembly { notEntered := sload(LOCK_FLAG_ADDRESS) }
                                       ^---------------^

dev-contracts/generated/ReentrancyGuard.sol:52:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 0) }
                          ^---------------^

dev-contracts/generated/ReentrancyGuard.sol:58:27: TypeError: Constant variables not supported by inline assembly.
        assembly { sstore(LOCK_FLAG_ADDRESS, 1) }
                          ^---------------^

Error: Compilation failed
    at processOutput (/Users/samueldare/Documents/Code/brave/zksync/contracts/node_modules/@ethereum-waffle/compiler/dist/cjs/compiler.js:36:15)
    at compileAndSave (/Users/samueldare/Documents/Code/brave/zksync/contracts/node_modules/@ethereum-waffle/compiler/dist/cjs/compiler.js:17:11)
