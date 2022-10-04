
pragma solidity >=0.8.0 <0.9.0;

contract YourContract {
    address payable private owner;
    
    constructor() {
        owner = payable(msg.sender);
    }

    function makePay() public payable {
        owner.transfer(msg.value);
    } 
}
