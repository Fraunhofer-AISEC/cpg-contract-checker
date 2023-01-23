    function addVoting(address[] memory _candidateAddress) public isOwner { 
    VotingCampaign storage compaign = campaigns[campaignId]; 
    for (uint i = 0; i < _candidateAddress.length; i++) { 
        compaign.candidates.push(Candidate({
            candidateAddress: _candidateAddress[i],
            voteCount: 0
        }));
    }
    compaign.loocUpTime = block.timestamp + 3 days; 
    emit NewCampaignAdded(campaignId);
    campaignId++; 
}
