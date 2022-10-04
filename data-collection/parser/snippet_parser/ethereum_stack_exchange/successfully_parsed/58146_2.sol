contract AirDrop is Ownable {

  ERC20 public token;
  address public tokenWallet;
  address public tokenAddress;

  event TransferredToken(address indexed to, uint256 value);
  event FailedTransfer(address indexed to, uint256 value);

  constructor(address _tokenAddress, address _tokenWallet) public {
      tokenWallet = _tokenWallet;
      tokenAddress = _tokenAddress;
      token = ERC20(_tokenAddress);
  }

  function sendTokens(address[] destinations, uint256[] values, address _tokenAddress, address _tokenWallet) onlyOwner external {
      require(destinations.length == values.length);
      uint256 i = 0;
      while (i < destinations.length) {
          uint256 toSend = values[i] * 10**18;
          sendInternally(destinations[i], toSend, values[i]);
          i++;
      }
  }

  function sendTokensSingleValue(address[] destinations, uint256 value) onlyOwner external {
      uint256 i = 0;
      uint256 toSend = value * 10**18;
      while (i < destinations.length) {
          sendInternally(destinations[i] , toSend, value);
          i++;
      }
  }

  function sendInternally(address recipient, uint256 tokens, uint256 valueToPresent) internal {
    require(recipient != address(0));
    ERC20(tokenAddress).transfer(recipient, tokens);
  }


  function tokensAvailable() constant returns (uint256) {
    return token.allowance(tokenWallet, msg.sender);
  }

  function destroy() onlyOwner public {
    selfdestruct(owner);
  }
}
