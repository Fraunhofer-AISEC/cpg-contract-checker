function initiateTransaction( address payable _to, uint _amount ) public onlyUser returns(uint txnId) {
        transaction memory newTxn;
        newTxn.id = ++txnCount;
        newTxn.amount = _amount;
        newTxn.to = _to;
        newTxn.initiatedBy = msg.sender;
        newTxn.signedBy.push(msg.sender); 
        
    }
