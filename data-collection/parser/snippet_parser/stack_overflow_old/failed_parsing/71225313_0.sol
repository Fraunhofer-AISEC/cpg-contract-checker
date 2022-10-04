pragma solidity 0.5.12;

contract Bank{
    int balance;

    constructor() public {
        balance=1;
    }

    function getBalance() view public returns(int){
        return balance;
    }
    function withDraw(int amount) public returns(string memory) {
        if(balance>=amount){
            balance-=amount;
            return "success";
        }
        else{
            return "out of balance";
        }
    }
    function depositAmount(int amount) public{
        balance+=amount;
    }
}

For example : Smart contract deployed block number --> 12003155,
              While calling the depositAmount function it created a block --> 12003210,
              While calling the withDraw function it created a block --> 12003222
