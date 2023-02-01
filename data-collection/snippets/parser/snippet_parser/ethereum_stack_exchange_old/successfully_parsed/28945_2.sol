pragma solidity ^0.4.17;

contract NotReentrant {

    int x;

    function good() public returns(bool success) {

        x = 0;
        msg.sender.transfer(this.balance);
        return true;
    }

}
