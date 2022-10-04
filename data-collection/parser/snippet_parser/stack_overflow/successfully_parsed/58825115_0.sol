pragma solidity ^0.5.11;
contract MyFirstContract
{
    function() external payable { }

    function send(address payable _to, uint256 _value) public returns (bool) 
    {
        require(_value <= address(this).balance);
        _to.transfer(_value);
        return true;
    }
}   
