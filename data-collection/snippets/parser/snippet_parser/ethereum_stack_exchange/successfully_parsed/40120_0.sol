pragma solidity ^0.4.19;

contract ICO {
    address public owner;
    mapping(address => uint) public balances;
    address[] public buyers;

    uint constant public MULTIPLIER = 1000;

    function ICO() public {
        owner = msg.sender;
    }

    function getBuyersLength() public constant returns (uint) {
        return buyers.length;
    }

    function buy() public payable {
        uint coins = msg.value * MULTIPLIER;
        balances[msg.sender] += coins;
        buyers.push(msg.sender);
    }
}
