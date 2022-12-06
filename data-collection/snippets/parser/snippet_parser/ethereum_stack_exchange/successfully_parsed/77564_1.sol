contract sendEth {
  mapping(address => uint) balances;
  function invest() external payable {
    if(msg.value < 0.01 ether) {
      revert();
    }
    balances[msg.sender] += msg.value;
  }

  function balanceOf() external view returns(uint) {
    return address(this).balance;
  }

  function sendEther(address payable recipient) external {
    recipient.transfer(0.0001 ether);
  }
}
