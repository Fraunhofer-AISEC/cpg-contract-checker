Running 'scripts/test_loop.py::main'...
Transaction sent: 0x8380ef4abff179f08ba9704826fc44961d212e5ee10952ed3904b5ec7828c928
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  TestLoop.constructor confirmed   Block: 1   Gas used: 251810 (2.10%)
  TestLoop deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

set array in loop
Transaction sent: 0xfe72d6c878a980a9eeefee1dccdd0fe8214ee4772ab68ff0ac2b72708b7ab946
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  TestLoop.setArrayWithLoop confirmed   Block: 2   Gas used: 49454 (0.41%)

array  (1, 2, 3, 4) 


set array by copy from memory to storage
Transaction sent: 0x0106d1a7e37b155993a6d32d5cc9dc67696a55acd1cf29d2ed9dba0770436b98
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  TestLoop.setArrayWithoutLoop confirmed   Block: 3   Gas used: 41283 (0.34%)

array  (10, 9, 8, 7) 


deploy NoLoop contract
Transaction sent: 0x55ddded68300bb8f11b3b43580c58fed3431a2823bf3f82f0081c7bfce66f34d
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  NoLoop.constructor confirmed   Block: 4   Gas used: 160753 (1.34%)
  NoLoop deployed at: 0x7CA3dB74F7b6cd8D6Db1D34dEc2eA3c89a3417ec

array  (21, 22, 23, 24) 


deploy Loop contract
Transaction sent: 0x1aa64f2cd527983df84cfdca5cfd7a281ff904cca227629ec8b0b29db561c043
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  Loop.constructor confirmed   Block: 5   Gas used: 153692 (1.28%)
  Loop deployed at: 0x2fb0fE4F05B7C8576F60A5BEEE35c23632Dc0C27

array  (31, 32, 33, 34)
