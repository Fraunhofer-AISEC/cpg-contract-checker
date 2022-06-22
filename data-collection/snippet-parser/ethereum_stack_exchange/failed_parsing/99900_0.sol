 struct UserTokens {
        address token;
        mapping(address => uint256) balance;
    }

    mapping(address => UserTokens[]) public userTokens;

    function deposit(address _token, uint256 _amt) external {
        

        u = UserTokens({token: _token});
        u.balance[msg.sender] = u.balance[msg.sender].add(_amt);

        userTokens[msg.sender].push(u);

        ...
    }

   function getLockedBalance(address _token) public view returns (uint256) {
        return userTokens[msg.sender][_token].balance;
    }
