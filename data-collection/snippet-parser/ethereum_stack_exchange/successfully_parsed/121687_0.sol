

pragma solidity >=0.6.6 <0.9.0;

contract ExampleContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner");
        _;
    }

    function withdraw() public payable onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
