modifier ownerOnly {
    if(msg.sender != owner) revert();
    _;
}

function cleanup() public ownerOnly {
    if(!canDelete()) { 
        SelfDestructError("Invalid state. Cannot destruct");
        revert();
    }
    selfdestruct(owner);
}
