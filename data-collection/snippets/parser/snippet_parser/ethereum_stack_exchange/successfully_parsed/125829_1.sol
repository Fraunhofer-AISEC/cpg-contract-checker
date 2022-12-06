contract DonationChallenge {
    struct Donation {
        uint256 timestamp;
        uint256 etherAmount;
    }
    Donation[] public donations;

    address public owner;
        
    function DonationChallenge() public payable {       
        owner = msg.sender;
    
        Donation donation;
    
        donation.timestamp = now;
        donation.etherAmount = 10;
        
    }
}
