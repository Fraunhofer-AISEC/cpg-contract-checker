
pragma solidity ^0.8.17;

contract Event {
    event Log(address indexed sender, string message);
    event FakeLog(bytes32 indexed sig, address indexed sender, string message) anonymous;

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit FakeLog(Log.selector, msg.sender, "Hello World!");
    }
}
