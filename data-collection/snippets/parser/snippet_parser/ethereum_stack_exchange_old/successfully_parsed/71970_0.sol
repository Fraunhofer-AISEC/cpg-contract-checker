pragma solidity ^0.5.0;

contract Test{

    address payable owner;
    address payable buyerAddr;
    address payable withdrawAddr;

    mapping(address => uint) balances;

    constructor(address payable _buyerAddr, address payable _withdrawAddr) payable public {
        owner = msg.sender;
        buyerAddr = _buyerAddr;
        withdrawAddr = _withdrawAddr;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyBuyer(){
        require(msg.sender == buyerAddr);
        _;
    }

    function Send() payable public onlyBuyer{
        owner.transfer(msg.value);
    }

    function getBalanceOwner() view public returns(uint){
        return owner.balance;
    }

    function getBalanceBuyer() view public returns(uint){
        return buyerAddr.balance;
    }

    function getBalanceWithdrawAddr() view public returns(uint){
        return withdrawAddr.balance;
    }

    function getBalanceThis() view public returns(uint){
        return address(this).balance;
    }

    function Withdraw() onlyOwner public returns(bool success)  {
        uint wd = 5 ether;
        withdrawAddr.transfer(wd);
        return true;
    }



}
