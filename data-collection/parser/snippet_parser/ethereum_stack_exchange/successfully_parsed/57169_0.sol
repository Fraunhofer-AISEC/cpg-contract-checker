function transferOwnership(address _newOwner) public onlyOwner {
    _transferOwnership(_newOwner);
}

function _transferOwnership(address _newOwner) internal {
    require(_newOwner != address(0), "Adress can't be 0x0000...");
    emit OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
}
