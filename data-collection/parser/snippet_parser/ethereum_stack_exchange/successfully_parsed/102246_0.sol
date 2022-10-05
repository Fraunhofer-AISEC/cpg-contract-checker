
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ProductPage is Ownable {
    
    event PayDay(uint256 date);
    
    constructor() {}
    
    function purchase() external payable {}
    
    function contractBalance() public view returns(uint256) {
                return address(this).balance;
    }
    
    function withdraw() public onlyOwner {
        if (address(this).balance != 0) {
            (bool success,) = msg.sender.call{value: address(this).balance}("");
            require(success, "Failed to send Ether");
        }
        
        emit PayDay(block.timestamp);
    }
}
