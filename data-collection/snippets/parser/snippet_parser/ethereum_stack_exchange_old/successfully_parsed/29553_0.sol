pragma solidity ^0.4.10;

contract SplitBalance{

    address a1;
    address a2;
    uint account1;
    uint account2;

    function SplitBalance(address _a1, address _a2) public{
        a1 = _a1;
        a2 = _a2;
    }

    function withdraw(address _addr) public {
        if (_addr == a1)   
        {
            account1 = 0;
            a1.transfer(account1);
        }
        else if (_addr == a2)   
        {
            account2 = 0;
            a2.transfer(account2);
        }
    }

    function updateAddress1(address newAddress) public {
        if(msg.sender != a1)
           revert();
        a1 = newAddress;
    }

    function updateAddress2(address newAddress) public {
        if(msg.sender != a2)
           revert();
        a2 = newAddress;
    }

    function() payable public { 
        uint amount = msg.value/2;
        account1 = account1 + amount;
        account2 = account2 + amount;
    }
}
