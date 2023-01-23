function setup(address _wallet, uint _inheritance) public oneOwner {
    _wallet.push(_wallet);
    Inheritance [_wallet] = _inheritance; 
}

function moneyPaid() private isDeceased {
    for (uint i=0; i < wallets.length; i++) {
        wallets;[i].transfer(Inheritance[wallets][i]);
    }
}
