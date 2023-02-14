pragma solidity ^0.8.7;

contract Tip {
    function tip1(uint amount) external payable {
        block.coinbase.call{value: amount}(new bytes(0));
    }   
        
    bool locked = false;
    function tip2(uint amount) external payable {
        require(!locked, "Reentrant call detected");
        locked = true;
        block.coinbase.call{value: amount}(new bytes(0));
        locked = false;
    }   
}
