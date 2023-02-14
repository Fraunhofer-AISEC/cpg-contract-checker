pragma solidity ^0.4.15;

contract Test {
    function() public payable {
    }

    function pay(uint _amount) public returns (uint) {
        require(this.balance >= _amount);
        msg.sender.transfer(_amount);
    }
}
