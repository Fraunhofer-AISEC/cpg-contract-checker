pragma solidity ^0.5.2;

contract CampaignFactory{
address[] public deployedCampaigns;

function createCampaign(uint minimum) public{
    address newCampaign  = new Campaign(minimum,msg.sender);  

    deployedCampaigns.push(newCampaign);
} 

function getDeployedCampaigns() public view returns(address[] memory){
    return deployedCampaigns;
}
}
