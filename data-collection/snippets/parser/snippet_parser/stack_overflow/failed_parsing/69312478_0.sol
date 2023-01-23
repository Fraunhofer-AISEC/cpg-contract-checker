 function setAccounts(address[] memory _accounts) public onlyOwner { 
    for(uint i=0; i< _accounts.length; i++){
       accounts[_accounts[i]] = true;
    } 
