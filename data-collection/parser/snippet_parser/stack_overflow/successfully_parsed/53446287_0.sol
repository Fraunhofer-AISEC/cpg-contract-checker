pragma solidity ^0.4.23;

contract SandeepDappToken
{
    

    
    uint256  public totalSupply;

    string public name = ‘Dapp’;

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply )  public {
        balanceOf[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
    }

    function  transfer(address _to, unit256  _value) public returns (bool success)
    {
        require(balanceOf[msg.sender] >= _value);
    }
}
