function foo(uint _minShares) public {
        uint256 ethReserveBeforeDeposit = address(this).balance - msg.value;
        
        uint256 sharesMinted = (msg.value / ethReserveBeforeDeposit) * totalSupply();
        require(sharesMinted >= _minShares);
        
    }
