
pragma solidity ^0.8.0;

contract Donation {

    
    mapping(address=>uint) donation;

    
    
    function donate(uint _donateAmount) public payable {
        donation[msg.sender] += _donateAmount;
    }

    
    function getBalanaceDonor() external view returns(uint) {
        return donation[msg.sender];
    }
}
