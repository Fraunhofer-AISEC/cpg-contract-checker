    mapping (address => uint256) private _balances;

    function addToBalance(address[] memory accounts,uint[] memory amounts) public{
        mapping (address => uint256) memory balances = _balances;
       for(uint i=0;i<accounts.length;i++){
           balances[accounts[i]]+=amounts[i];
       }
       _balances = balances;
    }

