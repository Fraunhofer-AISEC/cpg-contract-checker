function buyToken(address _tokenContract) public payable{
      uint amountToPay = msg.value*price;
      IERC20 tokenContract = IERC20(_tokenContract);
      tokenContract.transfer(msg.sender, amountToPay);
    }
