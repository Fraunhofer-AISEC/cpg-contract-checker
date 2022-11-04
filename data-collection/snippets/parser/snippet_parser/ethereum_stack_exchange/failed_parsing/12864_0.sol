   pragma solidity ^0.4.2;

library Deck {
    
    
    

    function deal(address player, uint8 cardNumber) internal returns (uint8) {
        uint b = block.number;
        uint timestamp = block.timestamp;
        return uint8(uint256(keccak256(block.blockhash(b), player, cardNumber, timestamp)) % 52);

additional:

Fixed_value = (17)
payment = 2.07


if (uint256(keccak256(block.blockhash(b) ==Fixed_value {
true
      total= Player's ether * payment;
        ether Send to player account;

if (uint256(keccak256(block.blockhash(b) ==Fixed_value {
  false
     Stop
}
}
