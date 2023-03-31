function removeAccount(address _account) external {
    if(arrayOfAccounts.length == 1) {
        arrayOfAccounts.pop();
    }
    else if(arrayOfAccounts[arrayOfAccounts.length - 1] == _account) {
        arrayOfAccounts.pop();
    }
    else {
        for (uint i = 0; i < arrayOfAccounts.length - 1; i++) {
            if(_account == arrayOfAccounts[i]) {
                arrayOfAccounts[i] = arrayOfAccounts[arrayOfAccounts.length - 1];
                arrayOfAccounts.pop();
            }
        }
        
    }
}
