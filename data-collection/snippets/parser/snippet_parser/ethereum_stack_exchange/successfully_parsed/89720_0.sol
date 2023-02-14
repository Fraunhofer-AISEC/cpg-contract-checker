modifier onlyOwner() {
    require(isOwner(), "Ownable: caller is not the owner");
    _;
}

function isOwner() public view returns (bool) {
    return _msgSender() == _owner;
}

function _msgSender() internal view returns (address payable) {
    return msg.sender;
}
