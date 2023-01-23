pragma solidity ^0.8.7;

contract test {

struct Payment{
    uint amount;
    uint timeStamp;
}

struct Balance{
      uint totalBalance;
      uint numPayment;
      mapping(uint => Payment) payments;
    }
}
