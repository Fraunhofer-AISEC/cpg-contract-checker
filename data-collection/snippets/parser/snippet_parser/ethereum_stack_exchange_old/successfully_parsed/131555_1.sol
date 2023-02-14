pragma solidity ^0.8.0;

    contract Random {
        uint256 private RandNonce = 0;

        function randomNumber() public returns(uint256){
            uint256 rand = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,RandNonce))) % 100; 
            RandNonce++;
            return rand;
        }
  }
