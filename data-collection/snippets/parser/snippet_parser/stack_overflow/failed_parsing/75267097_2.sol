function removeAccount(address _account) external{
        uint counter = arrayOfAccounts.length;
        for(uint i; i < counter; i++) {
            if(arrayOfAccounts[i] == _account){
                for(uint j = i; j < counter-1; j++){
                    arrayOfAccounts[j] = arrayOfAccounts[j + 1];
                }
                arrayOfAccounts.pop();
                break;
            }
        }
    }
}
