    
    uint256 forLiquidity = contractTokenBalance.div(2);
    uint256 devExp = contractTokenBalance.div(4);
    uint256 forRewards = contractTokenBalance.div(4);

    
    uint256 half = forLiquidity.div(2);
    uint256 otherHalf = forLiquidity.sub(half);

    
    
    
    
    uint256 initialBalance = address(this).balance;

    
    
    swapTokensForEth(half.add(devExp).add(forRewards)); 

    
    uint256 Balance = address(this).balance.sub(initialBalance);
    uint256 oneThird = Balance.div(3);
    wallet.transfer(oneThird);

    addLiquidity(otherHalf, oneThird);
    
    emit SwapAndLiquify(half, oneThird, otherHalf); "
