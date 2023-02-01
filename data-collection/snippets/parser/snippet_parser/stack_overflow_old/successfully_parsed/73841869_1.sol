
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/access/Ownable.sol';

import './TopSevenPlayer.sol';

contract PublicMinter is Ownable {
  TopSevenPlayer private token;
  address private contractAddress;
  bool public IS_FREE_MINT = true;
  uint256 public BASE_PRICE = 500000000 gwei;

  event Log(uint256 amount, uint256 gas);
  event ResultsFromCall(bool success, bytes data);

  constructor() {}

  receive() external payable {}

  fallback() external payable {}

  

  function mint(
    address to,
    uint256 tokenId
  ) public payable {
    if (!IS_FREE_MINT) {
      require(msg.value >= BASE_PRICE, "Need to send more MATIC");
    }
    token.mint(to, tokenId, 1, '');
    emit Log(msg.value, gasleft());
  }

  

  function setContractAddress(address payable _address) external onlyOwner {
    contractAddress = _address;
    token = TopSevenPlayer(_address);
  }

  function withdraw() external onlyOwner {
    uint256 balance = address(this).balance;
    require(balance > 0, 'No amount left to withdraw');

    (bool success, bytes memory data) = (msg.sender).call{value: balance}('');
    require(success, 'Withdrawal failed');
    emit ResultsFromCall(success, data);
  }

  function setIsFreeMint(bool _isFreeMint) public onlyOwner {
    IS_FREE_MINT = _isFreeMint;
  }

  function setBasePrice(uint256 _basePrice) public onlyOwner {
    BASE_PRICE = _basePrice;
  }
}
