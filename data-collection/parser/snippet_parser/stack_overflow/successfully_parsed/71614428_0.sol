struct Candidate {
    address candidateAddress; 
    uint voteCount; 
}

struct VotingCampaign {
    bool isVotingCampaignEnded; 
    Candidate[] candidates; 
    uint poolToWin; 
    uint commission; 
    mapping(address => bool) votersVoted; 
    address winningAddress;
    uint loocUpTime; 
}

uint campaignId; 
mapping (uint => VotingCampaign) campaigns; 
