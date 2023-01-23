contract manager{

    string public keyVal; 
    vault public securityVault;

    constructor(string memory _vaultKey ){     
        keyVal = _vaultKey;
        securityVault = vault(keyVal);
    }
    
    
}

