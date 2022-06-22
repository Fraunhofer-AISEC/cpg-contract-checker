function testHash(
    address _sender, 
    uint8 _method, 
    uint256 _number, 
    uint256 _amount) 
    public 
    returns (bytes32) 
{
return keccak256(abi.encodePacked(_sender, _number, _method, _amount));    
}
