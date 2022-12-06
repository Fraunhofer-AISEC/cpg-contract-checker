function random(bytes32 seed) internal returns (uint) { 
  nonce++; 
  return uint(keccak256(abi.encodePacked(now, msg.sender.balance, nonce, block.coinbase, gasleft(), blockhash(block.number - 1), seed))) % 99; }
