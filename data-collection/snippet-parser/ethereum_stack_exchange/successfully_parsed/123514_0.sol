pragma solidity >=0.8.7;

contract DataTypes {
    uint public uintNumber = 9;
    int public intNumber = -68;
    uint8 public uint8Number = 17;
    bool public myBool = true;
    address public myAddress = msg.sender;
    bytes32 public myBytes32 = "hello byte";
    string public myString = "hello string";
}
