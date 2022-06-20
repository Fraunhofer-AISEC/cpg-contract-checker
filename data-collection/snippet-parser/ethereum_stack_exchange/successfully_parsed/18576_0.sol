contract Vault is SafeMath {

    
    bool public isVault = false;

    Token token;
    address multisig;
    uint256 unlockedAtBlockNumber;
    
    
    
    uint256 public constant numBlocksLocked = 12;

    
    
    function Vault(address _Multisig) internal {
        if (_Multisig == 0x0) throw;
        token = Token(msg.sender);
        multisig = _Multisig;
        isVault = true;
        unlockedAtBlockNumber = safeAdd(block.number, numBlocksLocked); 
    }

    
    function unlock() external {
        
        if (block.number < unlockedAtBlockNumber) throw;
        
        if (!token.transfer(multisig, token.balanceOf(this))) throw;
        
        if (!multisig.send(this.balance)) throw;
    }

    
    function () payable {
        if (block.number >= unlockedAtBlockNumber) throw;
    }

}
