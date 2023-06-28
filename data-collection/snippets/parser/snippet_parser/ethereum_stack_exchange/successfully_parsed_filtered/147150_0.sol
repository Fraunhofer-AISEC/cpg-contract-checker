
pragma solidity ^0.8.8;

contract Send {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function sendToOwner() public payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendToAddress(address payable _to) public payable {
        require(owner == msg.sender);
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    receive() external payable {}

    fallback() external payable {}
}
