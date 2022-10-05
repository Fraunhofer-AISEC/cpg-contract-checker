function setConstant(uint _amount) public {
        require(
            wethToken.allowance(msg.sender, address(this)) >= _amount,
            "Token 1 allowance too low"
        );  
        wethToken.transferFrom(msg.sender, address(this), _amount);
        constantOfTheSwap = daoToken.balanceOf(address(this)) * wethToken.balanceOf(address(this));
    }  

function swap(address _token, uint _amount) public {
            require(tokenIsAllowed(_token), "This swap is only for eth and dao token");
            balance[daoTokenAddress] = daoToken.balanceOf(address(this));
            balance[wethTokenAddress] = wethToken.balanceOf(address(this));
            IERC20(_token).transferFrom(msg.sender, address(this), _amount);
            balance[_token] = balance[_token] + _amount;
            
            
            uint constDivByBalanceOfToken = constantOfTheSwap / balance[_token];
            uint amountToSendToUser = balance[_token] - constDivByBalanceOfToken; 
            if (_token == wethTokenAddress) {
                daoToken.transfer(msg.sender, amountToSendToUser);
            }
            else if (_token == daoTokenAddress) {
                wethToken.transfer(msg.sender, amountToSendToUser);
            }
        }
