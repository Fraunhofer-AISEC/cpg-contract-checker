pragma solidity ^0.8.1;

contract SendMoneyExample{
    uint public balanceRecived;
    function recivedMoney()public payable{
        balanceRecived+=msg.value;
    }
    function getBalance()public view returns(uint){
        return address(this).balance;
    }
}
