 function FooBar() public returns (uint){
    
    uint256 _tokenPrice = 1e15;

    
    uint256 _ethereumSent = 1e14;

     
    uint256 _totalTokens = _ethereumSent / _tokenPrice;

    
    return _totalTokens;
}
