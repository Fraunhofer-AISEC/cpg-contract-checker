pragma solidity ^0.4.17;

contract Reentrant {

    int x;

    function bad() public returns(bool success) {

        msg.sender.transfer(this.balance);
        x = 0;
        return true;
    }

}
