contract Test {
mapping(address => uint256) public balance;

  constructor() {
  }

function withdraw() external {
require(balance[msg.sender] > 0, "Cannot withdraw funds: no funds available");
(bool success, ) = msg.sender.call{value: balance[msg.sender]}("");
require(success, "transfer failed");
balance[msg.sender] = 0;
  }

  function deposit () external payable {
balance[msg.sender] = msg.value;
  }
}
