pragma solidity 0.8.6;

contract Simple {
    uint32 value;
    constructor() payable {
        
        value = 22;
    }

    function foo() public {
        require(address(this).balance >= 0.1 ether);
        
        
        payable(msg.sender).transfer(0.1 ether);
    }
}
