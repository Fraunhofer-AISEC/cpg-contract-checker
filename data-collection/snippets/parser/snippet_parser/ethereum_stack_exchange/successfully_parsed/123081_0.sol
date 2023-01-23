pragma solidity ^0.8.0;

contract CrowdFunding {
    uint256 public minDonation;
    address public manager;
    mapping(address => uint256) public donationsList;
    uint256 public totalDonars;
    mapping(address => bool) isDonar;
    mapping(uint256 => mapping(address => uint256)) public donationsPerCampaign;

struct Campaign {
    uint256 id;
    string description;
    uint256 deadline;
    address payable donationReceiver;
    bool campaignCompleted;
    uint256 donationRaised;
    uint256 numberOfDoners;
    uint256 amountToBeRaised;
    address payable[] doners;
}

mapping(uint256 => Campaign) public campaigns;
uint256 totalCampaigns = 0;

constructor(uint256 _minDonation) {
    manager = msg.sender;
    minDonation = _minDonation;
}

modifier onlyManager() {
    require(manager == msg.sender);
    _;
}

modifier validCampaign(uint256 _campaignID) {
    require(_campaignID < totalCampaigns, "Invalid campaign");
    _;
}


function startCampaign(
    string memory _description,
    uint256 _deadlineInDays,
    uint256 _amountToBeRaised
) external {
    Campaign storage campaign = campaigns[totalCampaigns];
    campaign.id = totalCampaigns;
    campaign.description = _description;
    campaign.donationReceiver = payable(msg.sender);
    campaign.campaignCompleted = false;
    campaign.deadline = block.timestamp + (_deadlineInDays * 1 days);
    campaign.amountToBeRaised = _amountToBeRaised;
    totalCampaigns = totalCampaigns + 1;
}


function fund(uint256 _campaignID)
    external
    payable
    validCampaign(_campaignID)
{
    require(
        (msg.value) >= minDonation,
        "Amount less than minimum accepted amount"
    );
    uint256 amountLeftToRaise = campaigns[_campaignID].amountToBeRaised -
        campaigns[_campaignID].donationRaised;
    require(
        amountLeftToRaise >= msg.value,
        "Adding this much amount will surpass the need of campaign"
    );
    donationsList[msg.sender] = donationsList[msg.sender] + msg.value;
    if (!isDonar[msg.sender]) {
        totalDonars++;
    }
    isDonar[msg.sender] = true;
    campaigns[_campaignID].doners.push[payable(msg.sender)];
    campaigns[_campaignID].donationRaised =
        campaigns[_campaignID].donationRaised +
        msg.value;
    campaigns[_campaignID].numberOfDoners++;
    donationsPerCampaign[_campaignID][msg.sender] =
        donationsPerCampaign[_campaignID][msg.sender] +
        msg.value;
}

function getTotalDonation() external view returns (uint256) {
    return address(this).balance;
}

function getTotalDonationOfCampaign(uint256 _campaignID)
    external
    view
    returns (uint256)
{
    return campaigns[_campaignID].donationRaised;
}

function releaseFundsForCampaign(uint256 _campaignID)
    external
    onlyManager
    validCampaign(_campaignID)
{
    require(
        campaigns[_campaignID].amountToBeRaised ==
            campaigns[_campaignID].donationRaised
    );
    campaigns[_campaignID].campaignCompleted = true;
    campaigns[_campaignID].donationReceiver.transfer(
        campaigns[_campaignID].donationRaised
    );
}

function refund(uint256 _campaignId)
    external
    onlyManager
    validCampaign(_campaignId)
{
    require(
        block.timestamp > campaigns[_campaignId].deadline,
        "Campaign is still on"
    );
    require(
        campaigns[_campaignId].donationRaised <
            campaigns[_campaignId].amountToBeRaised
    );
}
}
