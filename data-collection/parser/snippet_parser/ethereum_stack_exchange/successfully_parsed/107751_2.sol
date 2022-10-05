
    IERC20 weth = IERC20(WETHAddress); 



    function makeDeposit(uint256 _amtDeposited) public { 
        require(_amtDeposited > 0);

        weth.transferFrom(msg.sender, address(this), _amtDeposited);
        
        

        amountDeposited += userBalance[msg.sender]; 
        
        emit Deposit(msg.sender, name, _amtDeposited);
    }
