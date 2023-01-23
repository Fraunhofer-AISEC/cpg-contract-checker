
pragma solidity >=0.8.0 <0.9.0;

contract YourContract {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function makePay() public payable {
        payable(owner).transfer(msg.value);
    } 
}
