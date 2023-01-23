pragma solidity ^0.4.17;

contract Campaign {

    struct Transaction {
        address Creditor;
        uint Amount;
        uint arrayPointer; 
    }
    address[] public transactionAddresses;  
    mapping(address => Transaction) public TransactionsMap; 

    function addTransaction(address _address,uint _amount) public {
        Transaction memory newRequest = Transaction({
           Creditor: _address,
           Amount: _amount,
           arrayPointer: transactionAddresses.push(_address)});
        TransactionsMap[_address]=newRequest;
    }
    function Testing()public {
        addTransaction(0xaef0B7Edd5D2E9315027ADFA4642E16a5c85Afd8,100);
        TransactionsMap[0xaef0B7Edd5D2E9315027ADFA4642E16a5c85Afd8].Amount++;
    }
    function a()public view  returns (uint){
        return TransactionsMap[0xaef0B7Edd5D2E9315027ADFA4642E16a5c85Afd8].Amount;
    }
    function b()public view  returns (address){
        return transactionAddresses[0];
    }
}
