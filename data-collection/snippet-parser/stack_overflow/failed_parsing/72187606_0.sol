    mapping(address => bool) whitelisted;
    mapping(address => bool) isWhitelisted;
    mapping(uint256 => address) users;
    uint256 userCounter;
    

    function whitelistAdd(address _addWhitelist) public onlyOwner {
            if (isWhitelisted[_addWhitelist]){
                whitelisted[_addWhitelist] = true;
            }else{
                users[userCounter] = _addWhitelist;
                isWhitelisted[_addWhitelist] = true;
                whitelisted[_addWhitelist] = true;
                userCounter ++;
