function deposit(
        address tokenAddress,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external payable nonReentrant  {
        require(amount > 0, "Treasury: Deposit amount must be greater than zero");
        require(msg.value == amount, "Treasury: amount mismatch");
        require(!isLocked, "Treasury: Contract is locked");
        if (tokenAddress == ETH_ADDRESS) { 
            
            emit DepositETH(tokenAddress, msg.sender, amount);
        } else {

            IERC165 tokenContract = IERC165(tokenAddress);
            if (isERC777(tokenAddress)) {

                IERC777(tokenAddress).send(address(this), amount, abi.encode(userData, operatorData));
                emit DepositERC777(tokenAddress, msg.sender, amount);

            } else if (tokenContract.supportsInterface(type(IERC20).interfaceId)) {

                require(allowedTokens[tokenAddress], "Treasury: Token not allowed");
                SafeERC20.safeTransferFrom(IERC20(tokenAddress), msg.sender, address(this), amount);
                emit DepositERC20(tokenAddress, msg.sender, amount);

            } else {
                revert("Treasury: Unsupported token type");
            }
        }
    }
