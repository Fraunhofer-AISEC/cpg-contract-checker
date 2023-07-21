
function stake(address _token, uint256 amount) external payable {
    address sender = msg.sender;
    address receiver = address(this);
    IERC20 token = IERC20(_token);

    if (_token == weth) {
        
        require(msg.value > 0, "No ETH sent");
        stakedAmountPerToken[_token] = stakedAmountPerToken[_token].add(amount);
        userData[sender].userBalance[_token] = userData[sender].userBalance[_token].add(amount);
        emit Staked(_token, sender, amount);
        if (!isUser[sender]) {
            users.push(sender);
            isUser[sender] = true;
        }
    } else {
        uint256 allowance = token.allowance(sender, receiver);
        require(allowance >= amount, "Insufficient token allowance");

        token.transferFrom(sender, receiver, amount);
        userData[sender].userBalance[_token] = userData[sender].userBalance[_token].add(amount);
        if (!isUser[sender]) {
            users.push(sender);
            isUser[sender] = true;
        }
        emit Staked(_token, sender, amount);
    }
}

function withdraw(address token, uint256 amount) external payable {
    address payable sender = payable(msg.sender);
    require(isUser[sender], "User has no staked balance");
    require(userData[sender].userBalance[token] >= amount, "Insufficient balance for withdrawal");

    if (token == weth) {
        
        IWETH(weth).withdraw(amount);
        sender.transfer(amount);
    } else {
        
        require(IERC20(token).transfer(sender, amount), "Token transfer failed");
    }

    userData[sender].userBalance[token] = userData[sender].userBalance[token].sub(amount);

    if (userData[sender].userBalance[token] == 0) {
        isUser[sender] = false;
    }

    emit Withdrawed(token, sender, amount);
}

