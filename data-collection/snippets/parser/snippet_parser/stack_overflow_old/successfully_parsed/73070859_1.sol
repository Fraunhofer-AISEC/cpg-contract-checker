    function test() external view returns (address) {
        address lockContract = 0x7ee058420e5937496F5a2096f04caA7721cF70cc;
        address tokenPair = 0x689a3bfE8b61CBe2C8938EbDfb11FeEaE7358359;

        uint256 _id;
        address _token;
        address _owner;
        uint256 _amount;
        uint256 _lockDate;
        uint256 _unlockDate;
        (_id, _token, _owner, _amount, _lockDate, _unlockDate) = IPinkLock01(lockContract).getLocksForToken(tokenPair,0,0);
        return _owner;
    }
