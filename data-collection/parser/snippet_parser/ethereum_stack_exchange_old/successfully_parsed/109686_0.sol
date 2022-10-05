
pragma solidity ^0.8.7;
contract Voting{
    
    address public owner = msg.sender;

    string myName = "Azid";

    function showData() public view returns (string memory)
    {
        return myName;
    }
   
}
