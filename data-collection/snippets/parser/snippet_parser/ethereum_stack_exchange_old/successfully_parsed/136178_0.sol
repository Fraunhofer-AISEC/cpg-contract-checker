mapping(address => uint256) public contributions;

function contribute() external payable {
  contributions[msg.sender] += msg.value;
}

function refund() external {
  address user = msg.sender;
  user.call{value: contributions[user]}("");
}
