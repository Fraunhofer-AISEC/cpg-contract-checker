function transferOwnership(address _new) onlyOwner payable public {
    address oldaddr = owner;
    owner = _new;
    TransferOwnership(oldaddr, owner);}
