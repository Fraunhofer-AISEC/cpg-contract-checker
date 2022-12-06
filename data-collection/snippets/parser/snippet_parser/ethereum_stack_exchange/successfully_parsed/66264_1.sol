pragma solidity ^0.4.24;

contract CampaignFactory{

address [] deployedCampaigns;
function createCampaign(uint deposit, address ll) public payable{
    require(msg.value > (40*deposit)/100 wei);
    address newCampaign = address((new Campaign).value(msg.value)(deposit, ll, 1));

    deployedCampaigns.push(newCampaign);
    } 

}
contract Campaign {
    constructor (uint depositInWei, address ll, uint weiCostOfEachToken) public payable{
    }

}
