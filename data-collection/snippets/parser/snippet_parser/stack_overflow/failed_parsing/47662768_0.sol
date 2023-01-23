contract Token is StandardToken {  
  function transfer(address _to, uint256 _value)  public returns (bool success) {
      return super.transfer(_to, _value);
    }
}

contract CrowdSale { 
  token = Token(:address)
  function buyToken() payable {
    token.transfer(beneficiary,tokenAmount); 
    anotherAddress.transfer(msg.value); 
  }
}
