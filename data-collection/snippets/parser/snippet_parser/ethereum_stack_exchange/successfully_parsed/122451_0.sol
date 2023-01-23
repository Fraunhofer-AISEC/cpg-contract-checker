contract Factory {
 address[] public campaigns;
 function createCampaign(uint minimum) public {
     Campaign deployed = new Campaign(minimum, address(msg.sender));
     campaigns.push(address(deployed));
 }
 function getCampaigns() public view returns(address[] memory){
     return campaigns;
 }
}