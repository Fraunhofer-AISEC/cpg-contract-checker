function newCampaign(address beneficiary, uint goal, uint deadline) returns (uint campaignID) {
    campaignID = numCampaigns++; 
    Campaign c = campaigns[campaignID]; 
    c.beneficiary = beneficiary;
    c.fundingGoal = goal;
    c.deadline = block.number + deadline;
}
