
pragma solidity >0.8.0;

contract campaignFactory {
    address[] public deployedCampaigns;
    event campaignCreated(
        address indexed owner,
        string indexed category,
        uint256 indexed timestamp,
        string title,
        string imageUrl,
        address campaignAddress,
        uint256 requireAmount
    );

    function createCampaign(
        string memory campaignTitle,
        string memory storyUrl,
        uint requireAmount,
        string memory category,
        string memory imageUrl
    ) public {
        Campaign newCampaign = new Campaign(
            campaignTitle,
            storyUrl,
            requireAmount,
            imageUrl,
            msg.sender
        );
        deployedCampaigns.push(address(newCampaign));
        emit campaignCreated(
            msg.sender,
            category,
            block.timestamp,
            campaignTitle,
            imageUrl,
            address(newCampaign),
            requireAmount
        );
    }
}

contract Campaign {
    event donated(address indexed donar, uint256 amount, uint256 timestamp);
    string public title;
    string public story;
    uint256 public requireAmount;
    string public imageUrl;
    address payable public owner;
    uint256 public receivedAmount;

    constructor(
        string memory _campaignTitle,
        string memory _story,
        uint256 _requireAmount,
        string memory _imageUrl,
        address campaignOwner
    ) {
        title = _campaignTitle;
        story = _story;
        requireAmount = _requireAmount;
        imageUrl = _imageUrl;
        owner = payable(campaignOwner);
    }

    function donate() public payable {
        require(requireAmount > receivedAmount, "Amount is fullfilled");
        owner.transfer(msg.value);
        receivedAmount += msg.value;
        emit donated(msg.sender, msg.value, block.timestamp);
    }
}
