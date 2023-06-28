contract Crowdfunding {
struct CampaignData {
    address recipient;
    uint contributed;
    uint goal;
    uint deadline;
    uint num_contributions;
    mapping(uint => Contribution) contributions;
}

struct Contribution {
    address contributor;
    uint amount;
}

uint nextCampaignId;
mapping(uint256 => CampaignData) campaigns;


function start(address recipient, uint256 goal, uint256 deadline) returns (uint id) {
    var campaign = campaigns[nextCampaignId];
    campaign.recipient = recipient;
    campaign.goal = goal;
    campaign.deadline = deadline;
    nextCampaignId ++;
    id = nextCampaignId;
}
}