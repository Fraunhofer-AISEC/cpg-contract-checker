function(uint _time) public payable {
  balance[msg.sender] += msg.value;
  timelock[meg.sender] = block.timestamp + _time
}
