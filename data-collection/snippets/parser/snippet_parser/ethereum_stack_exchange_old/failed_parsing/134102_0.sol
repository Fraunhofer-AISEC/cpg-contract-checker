
pragma solidity >=0.7.1 <0.9.0;
contract test{
    uint public myBalance1=msg.sender.balance;
    uint public myBalance2=address(this).balance;
    
}

The output in myBalance1=99 ether
The output in myBalance2=0 ether
