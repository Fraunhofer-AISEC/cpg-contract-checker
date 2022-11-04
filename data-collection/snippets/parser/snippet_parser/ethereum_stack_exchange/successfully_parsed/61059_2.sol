pragma solidity ^0.4.25;

contract Test {
    event Debug(address indexed _from, uint256 _value);

    function () public payable {
        buy();
    }

    function buy() public payable {
        emit Debug(msg.sender, msg.value);
    }
}
