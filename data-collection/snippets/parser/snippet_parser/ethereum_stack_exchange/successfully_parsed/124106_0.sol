contract Campaign {
    string public title;
    uint public requiredAmount;
    string public image;
    string public story;
    address payable public owner;
    uint public receivedAmount;

    event donated(address indexed donar, uint indexed amount, uint indexed timestamp);

    constructor(
        string memory campaignTitle, 
        uint requiredCampaignAmount, 
        string memory imgURI,
        string memory storyURI
    ) {
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
