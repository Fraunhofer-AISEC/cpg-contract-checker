    pragma solidity ^0.4.18;

    contract TransactionPool {

    address owner;
    uint totalPayments;

    function TransactionPool() public {
       owner = msg.sender;
    }

    function receivePayment() public payable {
       totalPayments += msg.value;
    }

    function() payable public { 
       totalPayments += msg.value;
    }
    }
