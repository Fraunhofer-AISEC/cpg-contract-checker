struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
        bool claimed;
    }

 mapping(uint256 => Campaign) public campaigns;


function cancelCampaign(uint256 _id, address _owner) external {
        Campaign memory campaign = campaigns[_id];
        if (_owner != msg.sender) revert CrowdFund__NotOwner();
        if (campaign.deadline > block.timestamp) revert CrowdFund__Started();

        delete campaigns[_id];

        emit CancelCampaign(_id);
    }


function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for (uint i = 0; i < numberOfCampaigns; i++) {
            Campaign storage item = campaigns[i];

            allCampaigns[i] = item;
        }
        return allCampaigns;
    }
