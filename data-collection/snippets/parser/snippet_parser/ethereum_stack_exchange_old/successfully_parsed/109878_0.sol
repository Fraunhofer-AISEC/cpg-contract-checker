function lock(uint256 time) public virtual onlyOwner {
    _previousOwner = _owner;
    _owner = address(0);
    _lockTime = now + time;
    emit OwnershipTransferred(_owner, address(0));
}

function unlock() public virtual {
    require(_previousOwner == msg.sender, "You can't unlock");
    require(now > _lockTime , "Contract is locked");
    emit OwnershipTransferred(_owner, _previousOwner);
    _owner = _previousOwner;
}
