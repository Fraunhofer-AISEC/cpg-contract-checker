pragma solidity ^0.4.11;

Contract CrowdFunding {

struct Funder {
    address addr;
    uint amount;
}

struct Campaign {
    address beneficiary;
    uint fundingGoal;
    uint numFunders;
    uint amount;
    mapping (uint => Funder) funders;
}

uint numCampaigns;
mapping (uint => Campaign) campaigns;

function newCampaign(address beneficiary, uint goal) returns (uint campaignID) {
    campaignID = numCampaigns++; 
    
    campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0);
}

function contribute(uint campaignID) payable {
    Campaign storage c = campaigns[campaignID];
    
    
    
    c.funders[c.numFunders++] = Funder({addr: msg.sender, amount: msg.value});
    c.amount += msg.value;
}

function checkGoalReached(uint campaignID) returns (bool reached) {
    Campaign storage c = campaigns[campaignID];
    if (c.amount < c.fundingGoal)
        return false;
    uint amount = c.amount;
    c.amount = 0;
    c.beneficiary.transfer(amount);
    return true;
}
}
