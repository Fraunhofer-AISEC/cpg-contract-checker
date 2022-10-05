function getErc20Balance() external view returns(uint){
        uint balance = _erc20.balanceOf(msg.sender) / 1000000000000000000;
        return balance;
    } 
