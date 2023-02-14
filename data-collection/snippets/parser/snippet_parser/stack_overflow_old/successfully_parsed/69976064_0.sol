
pragma solidity >0.8.0;

contract ContractB {
    
    uint256 public tokenName = uint256(2);
    event SetToken(uint256 _tokenName); 

    function setTokenName(uint256 _newName) external returns (uint256) {                
        setInternal(_newName);  
    }
    
    function setInternal (uint256 _newName) public returns (uint256)
    {
        tokenName = _newName;
        emit SetToken(tokenName);
        return tokenName;
    }
            
    function getTokenName() public view returns (uint256)
    {
        return tokenName;
    }        
}
