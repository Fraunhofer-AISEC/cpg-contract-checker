pragma solidity ^0.4.0;

contract SplitBalance{

    address a1;
    address a2;

    function SplitBalance(address _a1, address _a2) public{
        a1 = _a1;
        a2 = _a2;
    }

    function withdraw() public {
        uint money = this.balance;

        
        if (money % 2 == 1)   
           money = money - 1; 

        a1.transfer(money/2);
        a2.transfer(money/2);
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

    
    function() payable public { }
}
