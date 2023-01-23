
pragma solidity >=0.5.10 <0.7.0;

contract test {
    
    constructor() public payable {
        require(msg.value > 0, "User must submit a valid money amount");
        require(address(this).balance == 0, "Contract must be empty");
    }
    
}
