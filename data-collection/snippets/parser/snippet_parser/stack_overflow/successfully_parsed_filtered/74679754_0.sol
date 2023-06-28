
pragma solidity ^0.8.15;

struct Reward {
    uint256 contribution;
    uint256 maxNumber;
    string ImageLink;
}

contract CampaignFactory {

    Campaign[] public deployedCampaigns;

    function createCampaign(Reward[] memory _rewards)
        public
    {
        Campaign newCampaign = new Campaign(msg.sender);

        for (uint256 i = 0; i < _rewards.length; i++) {
            newCampaign.createReward(
                _rewards[i].contribution,
                _rewards[i].maxNumber,
                _rewards[i].ImageLink
            );
        }
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns()
        public
        view
        returns (Campaign[] memory)
    {
        return deployedCampaigns;
    }
}

contract Campaign {
    Reward[] public rewards;
    address public manager;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    constructor(address creator) {
        manager = creator;
    }

    function createReward(
        uint256 _contribution,
        uint256 _maxNumber,
        string memory _imageLink
    ) public restricted {
        Reward memory newReward = Reward({
            contribution: _contribution,
            maxNumber: _maxNumber,
            ImageLink: _imageLink
        });

        rewards.push(newReward);
    }
}
