pragma solidity ^0.4.22;

contract Test {

    uint256 public max_contribution = 50 ether; 
    uint256 public min_contribution = 0.1 ether; 

    function transfer() public payable returns (bool success) {
        require(msg.value >= min_contribution);
        require(msg.value <= max_contribution);
        return true;
    }
}
