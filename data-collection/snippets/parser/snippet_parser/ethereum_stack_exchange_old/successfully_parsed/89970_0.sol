

pragma solidity 0.7.4;

contract CoinFlip {
  uint public contractBalance;
  address owner;

  constructor() {
    owner = msg.sender;
    contractBalance = 0;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  event WinOrLose(bytes4 coinSide);

  
  function bet(uint chosenSide) public payable {
    
    require(msg.value >= 10000000000000000 && msg.value <= 10000000000000000000, "Improper amount entered.");

    
    contractBalance += msg.value;
    require(contractBalance >= msg.value * 2 + 100000000000000000, "Sorry, the contract cannot cover this bet.");

    uint side = block.timestamp % 2;
    bytes4 result;

    if (side == chosenSide) {
      result = "won";
      uint winnings = msg.value * 2;
      contractBalance -= winnings;
      (bool success, ) = msg.sender.call{value: winnings}("");
      require(success, "Ether send failed");
    } else {
      result = "lost";
    }
    emit WinOrLose(result);
  }

  fallback() external payable {}
  receive() external payable { contractBalance += msg.value; }

  function withdrawAll() public onlyOwner returns(uint) {
      uint toSend = address(this).balance;
      contractBalance = 0;
      (bool success, ) = msg.sender.call{value: toSend}("");
      require(success, "Ether send failed");
      return toSend;
  }

}
