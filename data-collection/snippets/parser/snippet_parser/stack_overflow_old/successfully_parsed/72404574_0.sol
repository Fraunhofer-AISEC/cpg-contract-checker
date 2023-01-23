struct Campaign {
    uint256 campaignID;
    string brand;
    uint256 budget;
    mapping(uint => Bidder[]) bidders;
}

struct Bidder {
    bool bided;
    uint256 bid;
    string name;
    address bidderAddress;
}


Campaign[] public campaigns;
uint totalCampaign = 0; 


function createCampaign(
    string memory _brand,
    uint256 _budget
    ) public  {
    Campaign storage _initialCampaign = campaigns.push();
    _initialCampaign.campaignID = totalCampaigns += 1;
    _initialCampaign.brand = _brand;
    _initialCampaign.budget = _budget;
    totalCampaign++;
}
