function refillAccount(address receiver) payable returns(bool isRefilled) {
    if (tx.origin.balance < [1 eth]) {
        refilledAccounts[receiver] = false;
        return false;
    }

    if ( !refilledAccounts[receiver] ) {
        refilledAccounts[receiver] = true;
        if( !receiver.send(1 ether) ) 
        throw;
        return true;
    }
}
