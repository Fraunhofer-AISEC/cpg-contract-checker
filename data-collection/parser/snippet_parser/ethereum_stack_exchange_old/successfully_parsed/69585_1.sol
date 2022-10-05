pragma solidity ^0.5.1;

contract MyContr {

    
    
    constructor() public payable {}

    function transfer(address payable receiver, uint amount) public {
        require(address(this).balance >= amount);
        receiver.transfer(amount);
    }
    
    
    function() external payable {}
}
