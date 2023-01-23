function campaign_funder(uint campaignID, uint funderID) constant returns (address) {
    return campaigns[campaignID].funders[funderID].addr;
}
