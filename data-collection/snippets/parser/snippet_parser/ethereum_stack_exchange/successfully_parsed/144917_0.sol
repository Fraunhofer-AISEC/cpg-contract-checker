
pragma solidity ^0.8.9;

contract CrowdFunding {
    event testConditon(
        uint256 deadline,
        uint256 currentTimeInMs,
        uint256 diff,
        bool condition
    );

    struct Campaign {
        address payable owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }

    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) public returns (uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];
        uint256 currentTimeInMs = block.timestamp * 1000;

        emit testConditon(
            _deadline,
            currentTimeInMs,
            _deadline - currentTimeInMs,
            _deadline > currentTimeInMs
        );

        require(
            _deadline > currentTimeInMs,
            "The deadline must be in the future"
        );

        campaign.owner = payable(_owner);
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.image = _image;
        campaign.amountCollected = 0;

        numberOfCampaigns++;

        return numberOfCampaigns - 1;
    }

    function donateToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;

        Campaign storage campaign = campaigns[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent, ) = payable(campaign.owner).call{value: amount}("");

        if (sent) {
            campaign.amountCollected += amount;
        }
    }

    function getDonators(uint256 _id)
        public
        view
        returns (address[] memory, uint256[] memory)
    {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for (uint256 i = 0; i < numberOfCampaigns; i++) {
            Campaign storage item = campaigns[i];
            allCampaigns[i] = item;
        }

        return allCampaigns;
    }

    function withdraw(uint256 _id) public {
        Campaign storage campaign = campaigns[_id];

        require(
            campaign.amountCollected >= campaign.target,
            "The campaign has not reached its target"
        );

        
        
        
        
        

        require(
            campaign.owner == msg.sender,
            "Only the owner of the campaign can withdraw the funds"
        );

        (bool success, ) = payable(campaign.owner).call{
            value: campaign.amountCollected
        }("");
        require(success, "Withdrawal failure");
        campaign.amountCollected = 0;
    }
}
