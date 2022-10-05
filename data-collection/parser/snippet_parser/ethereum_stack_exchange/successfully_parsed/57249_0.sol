contract Relay {

    IOtherContract private otherContractInterface;

    modifier onlyOwner() {
      require(msg.sender == owner, "Sender is not owner");
      _;
    }

    function initialize(address _otherContractAddress) external onlyOwner {

        otherContractInterface = IOtherContract(_otherContractAddress);
    }
}
