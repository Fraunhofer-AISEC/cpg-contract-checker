
pragma solidity ^0.8.0;

contract SponsorContract {
    address public sponsor;
    address public sponsoredParty;
    uint public sponsorshipAmount;
    bool public isApproved;
    
    constructor(address _sponsor, address _sponsoredParty, uint _sponsorshipAmount) {
        sponsor = _sponsor;
        sponsoredParty = _sponsoredParty;
        sponsorshipAmount = _sponsorshipAmount;
        isApproved = false;
    }
    
    function approveSponsorship() public {
        require(msg.sender == sponsoredParty, "Only the sponsored party can approve the sponsorship.");
        isApproved = true;
    }
    
    function cancelSponsorship() public {
        require(msg.sender == sponsor, "Only the sponsor can cancel the sponsorship.");
        require(!isApproved, "The sponsorship has already been approved and cannot be cancelled.");
        selfdestruct(payable(sponsor));
    }
    
    function withdrawFunds() public {
        require(msg.sender == sponsoredParty, "Only the sponsored party can withdraw funds.");
        require(isApproved, "The sponsorship has not been approved yet.");
        payable(sponsoredParty).transfer(sponsorshipAmount);
    }
}
