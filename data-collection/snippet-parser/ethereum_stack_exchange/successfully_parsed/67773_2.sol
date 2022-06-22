mapping(address => address) public _managedWallets;


function updateManagedWallets(address wallet, address owner) public isOwner {
    _managedWallets[wallet] = owner;
}

function getOwner(address wallet) public view returns (address owner) {
    owner = _managedWallets[wallet];
    return owner;
}
