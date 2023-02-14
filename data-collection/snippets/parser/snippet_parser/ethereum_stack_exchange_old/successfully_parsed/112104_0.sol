struct WalletTeam{
        address wallet;
        uint256 amount;
    }
    
    WalletTeam[] walletTeam;

function getWallet() public view returns (WalletTeam memory)
    {
        return walletTeam;
    }
