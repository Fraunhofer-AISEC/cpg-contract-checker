Campaigns public campaign;

constructor(uint amount, address donor, Campaigns campAdress) public payable {
    campaignAddress = address(campAdress);
    donors = Donor(msg.sender,amount,donor, campaignAddress);
    campaign = Campaigns(campaignAddress);
}




   function getC () view  public returns (
    address,
    uint ,
    uint  ,
    string memory ,
    uint,
    Project
       ) {
   return campaign.getCampaign();
}
