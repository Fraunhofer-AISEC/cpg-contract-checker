pragma solidity >0.8.0;
    contract campaignFactory{

Here is my address stored

    address [] public deployedCampaigns;
    event createdCampaign(
        address indexed owner,
        string indexed category, 
        uint indexed timestamp,
        string title, 
        string storyUrI,
        uint requireAmount,
        string imageUrI,
        address campaignAddress
        );
    function createCampaign(
        string memory title,
        string memory storyUrI,
        uint requireAmount,
        string memory category,
        string memory imageUrI
    )public{
    Campaign newCampaign=new Campaign(title,storyUrI,requireAmount,msg.sender,imageUrI);
    deployedCampaigns.push(address(newCampaign));
    emit createdCampaign(msg.sender, category, block.timestamp, title, storyUrI, requireAmount, imageUrI,address(newCampaign));
    }
    this is my other smart contract to creat campaigns and donate function to send amount to owner who deployed campaigns.
    
    contract Campaign{
    event donated(address indexed owner,uint indexed amount,uint indexed timestamp);
    string public campaignTitle;
    string public story;
    uint public requireAmount;
    uint public receivedAmount;
    address payable public campaignOwner;
    string public image;
    constructor(
        string memory _campaignTitle,
        string memory _story,
        uint _requireAmount,
        address _owner,
        string memory _image
    ){
     campaignTitle=_campaignTitle;
            story=_story;
            requireAmount=_requireAmount;
            campaignOwner=payable(_owner);
            image=_image;
    }
    function donate()payable public{
    require(requireAmount>receivedAmount,"Require Amount is fullfilled");
    campaignOwner.transfer(msg.value);
    receivedAmount+=msg.value;
    emit donated(msg.sender, msg.value, block.timestamp);
    }
    }
