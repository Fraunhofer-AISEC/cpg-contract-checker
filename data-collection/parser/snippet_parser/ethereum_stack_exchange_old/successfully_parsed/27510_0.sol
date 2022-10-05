contract myWallets
{
    mapping (address => bool) public Wallets;

    function setWallet(address _wallet) public{
        Wallets[_wallet]=true;
    }

    function contains(address _wallet) returns (bool){
        return Wallets[_wallet];
    }
}
