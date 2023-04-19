function removeAccount(address _account) external{
    uint numAccounts = arrayOfAccounts.length;
    for(uint i = 0; i < numAccounts; i++) {
        if(arrayOfAccounts[i] == _account){    
            arrayOfAccounts[i] = arrayOfAccounts[numAccounts - 1];    
            arrayOfAccounts.pop();    
            break;
        }
    }
}
