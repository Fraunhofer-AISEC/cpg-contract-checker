contract BlackLkisted is Ownerhip {
    mapping(address=>bool) isBlacklisted;

    function blackList(address _user) public onlyOwner {
        require(!isBlacklisted[_user], "user already blacklisted");
        isBlacklisted[_user] = true;
        
    }
    
    function removeFromBlacklist(address _user) public onlyOwner {
        require(isBlacklisted[_user], "user already whitelisted");
        isBlacklisted[_user] = false;
        
    }
    
    function transfer(address _to, uint256 _value) public {
        require(!isBlacklisted[_to], "Recipient is backlisted");
        
    }
}
