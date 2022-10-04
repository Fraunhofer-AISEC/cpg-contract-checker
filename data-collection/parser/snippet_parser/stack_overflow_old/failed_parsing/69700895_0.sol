
pragma solidity ^0.8.7;

...

 struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        mapping(address => bool) isConfirmed;
        uint numConfirmations;
    }

...

 function submitTransaction (address _to, uint _value, bytes memory _data) public onlyOwner{
        
        uint txIndex = transactions.length;
        
        transactions.push(Transaction({to: _to, value: _value, data: _data, executed: false, numConfirmations: 0}));
            
            emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
    }

...
