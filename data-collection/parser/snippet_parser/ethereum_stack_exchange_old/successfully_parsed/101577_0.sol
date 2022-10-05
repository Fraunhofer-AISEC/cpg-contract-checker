
contract timeTracker {

    mapping(address => uint256) public _startingTime;
    uint256 constant ONE_DAY = 86400;

    function setStartTime() public returns (uint time) {

        _startingTime[msg.sender] = block.timestamp;
        return _startingTime[msg.sender];
    }

    
    function checkIfDayPassed() public {
         
        require(block.timestamp - _startingTime[msg.sender] >= ONE_DAY, "Claim not ready");
  _startingTime[msg.sender] = block.timestamp;
    }
    
}
