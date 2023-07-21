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
