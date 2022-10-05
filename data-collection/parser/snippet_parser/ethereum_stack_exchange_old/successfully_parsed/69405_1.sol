address private _owner;
constructor () internal {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
}

function owner() public view returns (address) {
   return _owner;
}
