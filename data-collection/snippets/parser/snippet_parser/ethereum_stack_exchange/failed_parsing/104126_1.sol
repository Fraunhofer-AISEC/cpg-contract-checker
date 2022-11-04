mapping(address => address[]) wallets;

function getWallets(address _user) 
    public
    view
    returns(address[])
{
    return wallets[_user];
}

function newTimeLockedWallet(address _owner, uint256 _unlockDate)
    payable
    public
    returns(address wallet)
{
    
    wallet = new TimeLockedWallet(msg.sender, _owner, _unlockDate);
    
    
    wallets[msg.sender].push(wallet);

    
    if(msg.sender != _owner){
        wallets[_owner].push(wallet);
    }

    
    wallet.transfer(msg.value);

    
    Created(wallet, msg.sender, _owner, now, _unlockDate, msg.value);
}


function () public {
    revert();
}

event Created(address wallet, address from, address to, uint256 createdAt, uint256 unlockDate, uint256 amount);
