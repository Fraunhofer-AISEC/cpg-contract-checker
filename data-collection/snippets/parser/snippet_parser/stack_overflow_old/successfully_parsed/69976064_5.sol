contract ContractB {
    
    uint256 public tokenName = uint256(2);

    function setTokenName(uint256 _newName) external {                
      tokenName=_newName;
    }
    
    
    function getTokenName() public view returns (uint256)
    {
        return tokenName;
    }
    
}
