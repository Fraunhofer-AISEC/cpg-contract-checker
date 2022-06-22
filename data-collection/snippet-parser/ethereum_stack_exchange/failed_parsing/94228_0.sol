constructor(address _chi, address payable _owner) public {
    chi = IFreeFromUpTo(_chi);
    
    
    owner = _owner;
    authorizedUsersList[_owner] = true;
}

modifier discountCHI {
    uint gasStart = gasleft();
    _;
    uint gasSpent = 21000 + gasStart - gasleft() + 16 * msg.data.length;
    chi.freeFromUpTo(address(this), (gasSpent + 14154) / 41947);
}
