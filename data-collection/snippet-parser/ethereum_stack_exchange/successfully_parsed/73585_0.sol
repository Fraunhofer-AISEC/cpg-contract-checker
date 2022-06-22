function commitTask(int256 _temp, string memory _location, string memory _time) public inState(State.Created) payable
{

    
    require (keccak256(abi.encodePacked(location)) == keccak256(abi.encodePacked(_location)), "Wrong location.");
    require(_temp < 35 && _temp > -5, "Temperature out of range");
    dataCount += 1;
    if(dataCount == rewardNum)
    {
        msg.sender.transfer(reward);
        emit TaskDone();
    }

    emit DataCommited( _temp, _location, _time);
}