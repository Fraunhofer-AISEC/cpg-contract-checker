function removeAccount(address _account) external{
        uint counter = arrayOfAccounts.length;
        uint index;
        for(uint i; i < counter; i++) {
            if(arrayOfAccounts[i] == _account){
                index = i;
                break;
            }
        for(uint i = index; i < counter-1; i++){
                arrayOfAccounts[i] = arrayOfAccounts[i + 1];
            }
            arrayOfAccounts.pop();
        }
    }
        }
    }
