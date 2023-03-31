 
    function launchCampaign(string calldata _title, string calldata _description, uint _goal, uint256 _startAt, uint256 _endAt) external {
    
    require(_startAt >= block.timestamp, "Invalid start date");
    require(_endAt >= _startAt, "Invalid end date");
    require(_endAt <= block.timestamp + 30 days, "Cannot go past 30 days");
    require(_goal > 0, "Goal must be greater than 0");
    require(bytes(_title).length <= 50, "Title too long");
    require(bytes(_description).length <= 2000, "Description too long");
    
    totalCampaigns++;
    
    campaigns[totalCampaigns] = Campaign({
      owner: msg.sender,
      title: _title,
      goal: _goal,
      pledged: 0,
      description: _description,
      startAt: _startAt,
      endAt: _endAt,
      claimed: false
    });
    
    emit Launch(totalCampaigns, msg.sender, _title, _goal, _description, _startAt, _endAt);
