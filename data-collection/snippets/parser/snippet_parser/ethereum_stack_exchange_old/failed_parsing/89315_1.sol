constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply, address payable feeReceiver, address tokenOwnerAddress) public payable {
      _name = "Token Example";
      _symbol = "TE";
      _decimals = 18;

      
      _mint(0x000000000000000, 300000000000000);

      
      feeReceiver.transfer(msg.value); (and delete this to stop fee payment)
    }
