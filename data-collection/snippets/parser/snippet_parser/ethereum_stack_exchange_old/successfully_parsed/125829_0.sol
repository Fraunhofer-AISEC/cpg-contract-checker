pragma solidity ^0.4.21;

contract DonationChallenge {
    struct Donation {
        uint256 timestamp;
        uint256 etherAmount;
    }
    
    Donation[] public donations;

    
    address public owner;

    Donation donation;
        
    function DonationChallenge() public payable {       
        owner = msg.sender;
        donation.timestamp = now;
        donation.etherAmount = 10;
        
    }
}
