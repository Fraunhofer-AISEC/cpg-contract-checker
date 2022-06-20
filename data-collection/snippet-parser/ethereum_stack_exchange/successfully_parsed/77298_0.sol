pragma solidity ^0.5.11;
contract MyFirstContract
{
    function() external payable { }
        function getBalance() public view returns(uint)
        {
            return address(this).balance;
        }
        
    function send(address payable _To )public payable returns (bool)
    {
     _To.transfer(msg.value);
     return true;
    }
}
