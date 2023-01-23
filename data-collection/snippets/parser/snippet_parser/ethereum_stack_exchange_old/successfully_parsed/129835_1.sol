function depositTokens(uint256 _value) public payable {
require(_value > 0, "Amount must be greater than 0");

token.transferFrom(msg.sender, address(this), _value);

stakingBalance[msg.sender] += _value;

if (!hasStaked[msg.sender]) {
  
  stakers.push(msg.sender);
}

isStaking[msg.sender] = true;
hasStaked[msg.sender] = true;
}
