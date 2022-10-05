pragma solidity ^0.8.3;
    
contract Testing {
        string public astring="firstvalue";
        function setString(string memory newValue)public{
            astring=newValue;
        }
}
