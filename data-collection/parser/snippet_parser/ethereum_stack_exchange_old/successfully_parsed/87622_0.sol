pragma solidity ^0.4.17;

contract ContractFactory {
    address[] public deployedCampaigns;
    string[] public title;
    
    function getDeployedCampaigns() public view returns (address[], string[]) {
        return (deployedCampaigns, title);
    }
    
    function createCampaign(uint min, string name) public {
        address newCampaign = new Campaign(min, name, msg.sender);
        title.push(name);
        deployedCampaigns.push(newCampaign);
    }
}

contract Campaign {
    
    address public organizer;
    uint public minContribution;
    string public title;
    
    function Campaign(uint min, string name, address creator) public {
        organizer = creator;
        minContribution = min;
        title = name;
    }
}

