
pragma solidity ^0.8.4;

interface IBank {
    function addTax(uint256 moneyToAdd) external payable;
   
    
}

contract Counter {
    uint public count;
    address bankAddress;

    function setbankAddress(address _bankAddress) public payable {
       bankAddress = _bankAddress;
    }

    function addMon(uint moneyToAdd) public payable {
        require(moneyToAdd <= msg.value, "Ether value sent is not 
        correct");
        
    }
    function pay(uint _Amount) public payable {
        IBank(bankAddress).addTax{value:_Amount}(_Amount);
 
    }
}
