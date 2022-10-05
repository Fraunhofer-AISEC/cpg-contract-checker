pragma solidity ^0.4.19;

interface Audit {
    function CheckBalance(uint WithdAmount) public view returns(bool);
    function lending() public view returns(bool);
}

contract Fin_Inst is Audit{
    uint public Money;

    function Fin_Inst(uint Value) public {
        Money = Value;
    }

    function Deposit(uint DepAmount) public {
        Money = Money + DepAmount; 
    }

    function Withdraw(uint WithdAmount) public {
        if(CheckBalance(WithdAmount) == true){
            Money = Money - WithdAmount;
        }
    }

    function Balance() external view returns (uint) {
        return Money;
    }

    function CheckBalance(uint WithdAmount) public view returns (bool) {
        return Money >= WithdAmount;
    }

    function lending() public view returns (bool) {
        return Money > 0;
    }
}
