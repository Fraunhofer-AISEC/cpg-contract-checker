pragma solidity ^0.8.1;

contract sendMoneyExamples{
    uint public getRecivedMoney;
    function reciveMoney()public payable{
        getRecivedMoney=getRecivedMoney+msg.value;
    }
    function getBalance()view public returns(uint){
        return address(this).balance;
    }
    function withdraw()public {
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }
    function withdrawato(address payable _to)public{
        _to.transfer(getBalance());
    }
}
