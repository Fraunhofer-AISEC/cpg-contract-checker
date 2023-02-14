pragma solidity ^0.4.24;

contract MyContract {
    event MyEvent();

    function myFunction() public {
        emit MyEvent();
    }
}
