pragma solidity ^0.5.2;

contract Bill {

    string filehash;
    string locker;
    address userwallet;
    uint256 amount;

    event isDeposit(
       string filehash,
       string locker,
       address userwallet,
       uint256 amount
    );


    function Deposit(string memory _filehash, string memory _locker) public payable{
        filehash = _filehash;
        locker = _locker;
        amount = msg.value;
        userwallet = msg.sender;
        emit isDeposit(filehash, locker, userwallet, amount);  
   }

}
