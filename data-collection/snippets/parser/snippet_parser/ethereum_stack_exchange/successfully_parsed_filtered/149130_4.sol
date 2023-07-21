  constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);

        _grantRole(TOKEN_MANAGER_ROLE, msg.sender);
        _grantRole(NFT_MANAGER_ROLE, msg.sender);
        _grantRole(LOCK_MANAGER_ROLE, msg.sender);
        _grantRole(WITHDRAWER_ROLE, msg.sender);

        
        allowedTokens[projectToken] = true;
        allowedTokens[ETH_ADDRESS] = true;
    }



    function isERC777(address tokenAddress) private view returns (bool) {
        bytes memory payload = abi.encodeWithSignature("granularity()");

        (bool success, bytes memory returnData) = tokenAddress.staticcall(payload);

        return success && (returnData.length == 32);
    }
    
    function getBalance(address token) external view returns (uint256) {
        require(allowedTokens[token], "Treasury: Token not allowed");

        if (token == address(0)) {
            return address(this).balance;
        }
        return IERC20(token).balanceOf(address(this));
    }
