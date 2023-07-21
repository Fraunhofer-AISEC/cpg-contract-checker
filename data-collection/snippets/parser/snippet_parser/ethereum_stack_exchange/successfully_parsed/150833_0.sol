
 uint startTime;
 uint duration;


  function updateCampaignStatus() external onlyOwner {
        for (uint i = 0; i < s_numberOfCampaigns; i++) {
            if (_checkTimerExpired(i)) {
                setCampaignStatus(i, CampaignStatus.REVERTED);
            }
        }
    }


  function setCampaignStatus(
        uint256 _id,
        CampaignStatus _status
    ) internal onlyOwner {
        Campaign storage campaign = s_campaigns[_id];

        if (!s_campaignExist[_id]) revert CrowdFund__Required();

        campaign.status = _status;
    }

    function _checkTimerExpired(uint256 _id) internal view returns (bool) {
        Campaign storage _campaign = s_campaigns[_id];
        bool isExpired = _campaign.deadline <= block.timestamp;

        return isExpired;
    }


    function getRemainingTime(uint256 _id) external view returns (uint) {
        require(startTime > 0, "Start time not started yet");

        Campaign storage campaign = s_campaigns[_id];
        if (!s_campaignExist[_id]) revert CrowdFund__Required();

        uint remainingTime = 0;

        if (block.timestamp < campaign.deadline) {
            remainingTime = campaign.deadline - block.timestamp;
        } else {
            remainingTime = 0;
        }
        return remainingTime;
    }


   function _startTimer(uint256 _durationInDays) internal {
        require(_durationInDays > 0, "Deadline must be greater than zero");

        uint256 durationInSeconds = _durationInDays * 1 days;
        startTime = block.timestamp;
        duration = durationInSeconds;

        emit TimerStarted(startTime, duration);
    }



function createCampaign(
        Category _category,
        string memory _title,
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) external returns (uint256) {
        if (_target < 0 ether) revert CrowdFund__Required();
        if (_deadline < block.timestamp) revert CrowdFund__Required();

        Campaign storage campaign = s_campaigns[s_numberOfCampaigns];

        campaign.id = s_numberOfCampaigns;
        campaign.owner = msg.sender;
        campaign.title = _title;
        campaign.description = _description;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.amountCollected = 0;
        campaign.image = _image;
        campaign.donators = new address[](0);
        campaign.donations = new uint256[](0);
        campaign.category = _category;

        _startTimer(_deadline);

        campaign.status = CampaignStatus.OPEN;

        s_campaignExist[campaign.id] = true;

        s_numberOfCampaigns++;

        emit CreatedCampaign(
            s_numberOfCampaigns,
            msg.sender,
            _category,
            _target,
            _deadline
        );

}