pragma solidity ^0.4.0;

interface Audit {
    function CheckBlance() public returns(bool);
    function lending() public returns(bool);
}

contract Fin_Inst is Audit{
    uint public Money;

    function Fin_Inst(uint Value) public {
        Money = Value;
    }

    function Deposit(uint DepAmount) public{
        Money = Money + DepAmount; 
    }

    function Withdraw(uint WithdAmount) public{
        if(CheckBlance(WithdAmount) == true){
            Money = Money - WithdAmount;
        }

    }

    function Balance() public constant returns (uint){
        return Money;
    }

    function CheckBlance(uint WithdAmount) public returns (bool){
        return Money >= WithdAmount;
    }

    function lending() public returns (bool){
        return Money > 0;
    }

}
