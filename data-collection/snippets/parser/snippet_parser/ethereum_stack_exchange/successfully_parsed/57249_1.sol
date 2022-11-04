contract OtherContract {


  address relay;

  modifier onlyRelay() {
      require(msg.sender == relay, "Sender is not relay.");
      _;
  }

  function setRelay(address _relay) external onlyOwner {
      relay = _relay;
  }
}
