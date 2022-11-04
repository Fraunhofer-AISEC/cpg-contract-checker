function refundTokens(address _token, address _refund, uint _value) onlyOwner {
    require(_token != this);
    ERC20 token = ERC20(_token);
    token.transfer(_refund, _value);
    RefundTokens(_token, _refund, _value);
  }
