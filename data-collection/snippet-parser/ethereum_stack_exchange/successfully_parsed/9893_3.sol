function extendDeadline(uint campaignID, uint256 newDeadline) {
    var campaign = campaigns[campaignId];
    campaign.deadline = newDeadline;
}
