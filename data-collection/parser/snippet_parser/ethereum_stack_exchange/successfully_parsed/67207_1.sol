pragma solidity ^0.5.0;

contract Betting {

    struct Bet {
        uint betId;
        uint campaignId;
        address sender;
        uint stake;
        bool betValue;
    }

    struct BetCampaign {
        uint campaignId;
        Bet[] bets;
        mapping(address => bool) userReserved; 
        uint betEndTime;
        bool isEnded;
    }

    event BetCampaignCreated(uint campaignId, uint betEndTime);
    event BetAdded(uint betId, uint campaignId, address indexed user, uint256 betAmount, bool betsTrue);

    BetCampaign[] public betCampaigns;
    mapping(uint => bool)  betCampaignReserved;
    mapping(uint => bool) betReserved;
    uint nonce;

    constructor() public {
        nonce = 0;
    }

    modifier isLater(uint time) {
        require(time > now, "The end time must be in the future");
        _;
    }

    modifier campaignExistsM(uint campaignId) {
        require(campaignExists(campaignId), "The campaign does not exist");
        _;
    }

    modifier userNotInCampaign(uint campaignId, address user) {
        require(!betPlaced(campaignId, user));
        _;
    }

    modifier userInCampaign(uint campaignId, address user) {
        require(betPlaced(campaignId, user));
        _;
    }

    modifier isSelf(address target) {
        require(msg.sender == target);
        _;
    }

    modifier enoughMoney(uint amount) {
        require(msg.value >= amount);
        _;
    }

    function generateId() internal returns (uint) {
        nonce += 1;
        return uint(keccak256(abi.encodePacked(nonce)));
    }

    function campaignExists(uint campaignId) internal view returns (bool) {
        return betCampaignReserved[campaignId];
    }

    function createCampaign(uint betEndTime) public isLater(betEndTime) {
        while (true) {
            uint id = generateId();
            if (!campaignExists(id)) {
                BetCampaign memory newCampaign = BetCampaign(id, new Bet[](0), betEndTime, false);
                betCampaigns.push(newCampaign);
                betCampaignReserved[id] = true;
                emit BetCampaignCreated(id, betEndTime);
                break;
            }
        }
    }

    function getCampaignInformation(uint campaignId) public view campaignExistsM(campaignId) returns (uint, uint, bool) {
        BetCampaign memory campaign;
        for (uint i = 0; i < betCampaigns.length; i++) {
            if (betCampaigns[i].campaignId == campaignId) {
                campaign = betCampaigns[i];
                break;
            }
        }
        return (campaign.campaignId, campaign.betEndTime, campaign.isEnded);
    }

    function getCampaign(uint campaignId) internal view campaignExistsM(campaignId) returns (BetCampaign storage) {
        uint index = 0;
        for (uint i = 0; i < betCampaigns.length; i++) {
            if (betCampaigns[i].campaignId == campaignId) {
                index = i;
                break;
            }
        }
        BetCampaign storage campaign = betCampaigns[index];
        return campaign;
    }

    function betExists(uint betId) internal view returns (bool) {
        return betReserved[betId];
    }

    function addBet(uint campaignId, address sender, uint stake, bool betValue)
    payable public isSelf(sender) enoughMoney(stake) campaignExistsM(campaignId) userNotInCampaign(campaignId, sender) {
        while (true) {
            uint id = generateId();
            if (!betExists(id)) {
                BetCampaign storage campaign = getCampaign(campaignId);
                campaign.bets.push(Bet(id, campaignId, sender, stake, betValue));
                campaign.userReserved[sender] = true;
                emit BetAdded(id, campaignId, sender, stake, betValue);
                break;
            }
        }
    }

    function getBet(uint campaignId, address sender)
    public view campaignExistsM(campaignId) userInCampaign(campaignId, sender) returns (uint, uint, address, uint, bool) {
        Bet memory bet;
        BetCampaign memory campaign = getCampaign(campaignId);
        for (uint i = 0; i < campaign.bets.length; i++) {
            if (campaign.bets[i].sender == sender) {
                bet = campaign.bets[i];
            }
        }
        return (bet.betId, bet.campaignId, bet.sender, bet.stake, bet.betValue);
    }

    function betPlaced(uint campaignId, address sender) public view campaignExistsM(campaignId) returns (bool) {
        BetCampaign storage campaign = getCampaign(campaignId);
        return campaign.userReserved[sender];
    }

}
