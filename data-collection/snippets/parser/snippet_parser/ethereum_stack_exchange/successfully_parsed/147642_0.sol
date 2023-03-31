  
    function pledgeTo(uint _id) external payable {
    Campaign storage campaign = campaigns[_id];
    require(block.timestamp >= campaign.startAt, "Hasn't started");
    require(block.timestamp <= campaign.endAt, "Has ended");
    
    campaign.pledged += msg.value;
    pledgedAmount[_id][msg.sender] += msg.value;
    
    emit Pledge(_id, msg.sender, msg.value);
    }
    
