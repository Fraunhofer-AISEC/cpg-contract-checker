contract CampaignFactory {

    event campaignCreated(
        string indexed category,
        uint indexed timestamp,
        address indexed owner, 
        string title, 
        uint requiredAmount, 
        address campaignAddress, 
        string imageURI
    );

    function createCampaign(string memory campaignTitle ,uint requiredCampaignAmount, string memory category, string memory imgURI, string memory storyURI) public {
        Campaign newCampaign = new Campaign(campaignTitle, requiredCampaignAmount, imgURI, storyURI);
        emit campaignCreated(category, block.timestamp , msg.sender, campaignTitle, requiredCampaignAmount, address(newCampaign), imgURI );
    }

}



contract Campaign {
    string public title;
    uint public requiredAmount;
    string public image;
    string public story;
    address payable public owner;
    uint public receivedAmount;

    event donated(address indexed donar, uint indexed amount, uint indexed timestamp);

    constructor(string memory campaignTitle ,uint requiredCampaignAmount, string memory imgURI, string memory storyURI) {
        title = campaignTitle;
        requiredAmount = requiredCampaignAmount;
        image = imgURI;
        story = storyURI;
        owner = payable(msg.sender);
    }

    function donate() public payable {
        require(requiredAmount > receivedAmount, "required amount fullfilled");
        owner.transfer(msg.value);
        receivedAmount += msg.value;
        emit donated(msg.sender, msg.value, block.timestamp);
    }
}
