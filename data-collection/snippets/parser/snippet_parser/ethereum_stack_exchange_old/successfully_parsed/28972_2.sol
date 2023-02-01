pragma solidity ^0.4.24;

contract ChildContract {
    event CalledBy(address callee);
    function emitEvent() internal {
        emit CalledBy(msg.sender);
    }
}

contract Caller is ChildContract {
    function internalCall() {
        emitEvent();
    }
}
