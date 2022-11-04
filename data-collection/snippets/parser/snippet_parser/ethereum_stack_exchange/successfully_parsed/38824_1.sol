pragma solidity ^0.4.11;

contract HodlEthereum {
    event Hodl(address indexed hodler, uint indexed amount);
    event Release(address indexed hodler, uint indexed amount);
    mapping (address => uint) public hodlers;
    uint constant targetTime = 8; 
    uint constant targetBlock = 8;

    function() payable {
        hodlers[msg.sender] += msg.value;
        Hodl(msg.sender, msg.value);
    }

    function release() returns (bool success){
        require (block.number >= targetBlock && hodlers[msg.sender] > 0);
        uint value = hodlers[msg.sender];
        hodlers[msg.sender] = 0;
        msg.sender.transfer(value);
        Release(msg.sender, value);
    }

    function getBalance(address hodler) returns (uint balance){
      balance = hodlers[hodler];
    }
}
