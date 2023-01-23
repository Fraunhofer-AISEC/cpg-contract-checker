pragma solidity ^0.4.7;

contract CallMe
{
    event UserRegistered(address indexed _from, string _attr);

    address public minter;     

    modifier onlyOwner {
        if (msg.sender != minter)
            throw;
        _;
    }

    function CallMe() {
        minter = msg.sender;
    }

    function() { 
        throw;
    }

    function registrationRequest(address _toAdd, string _code) {

        
        
        UserRegistered(_toAdd, _code);
    }


    function getMinter() constant returns (address) {
        return minter;
    }
}
