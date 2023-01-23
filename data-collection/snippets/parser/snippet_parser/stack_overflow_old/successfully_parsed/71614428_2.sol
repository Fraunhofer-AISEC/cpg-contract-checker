function viewCompaing(uint _campaignId) public view returns(Candidate[] memory, address) {
    return (campaigns[_campaignId].candidates, campaigns[_campaignId].winningAddress); 
}
