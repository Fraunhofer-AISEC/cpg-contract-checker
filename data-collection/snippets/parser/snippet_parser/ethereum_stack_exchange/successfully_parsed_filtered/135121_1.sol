contract Contract {
    struct StructAccount { 
        uint256 Index; 
        address Wallet; 
        uint256 Balance; 
        uint256 Time; 
        uint256 RegDate;
        uint256 LastDate;
    }  

    StructAccount[] public Accounts;

    function getLowerLastDate() public returns (uint, address) {
        StructAccount[] memory accountsCopy = Accounts;
        uint lowerDate = block.timestamp;
        uint Key = 0;
        for (uint i = 0; i < accountsCopy.length; i++) {
            if(accountsCopy[i].LastDate != 0){
                if( accountsCopy[i].LastDate <= lowerDate ){
                    lowerDate = accountsCopy[i].LastDate;
                    Key = i;
                }
            }
        }

        
        Accounts[Key].LastDate = 0; 
        return (lowerDate, accountsCopy[Key].Wallet);
    }
}
