address private _owner;

modifier onlyOwner() {
    _checkOwner();
    _;
}

function owner() public view virtual returns (address) {
    return _owner;
}


function _checkOwner() internal view virtual {
    require(owner() == _msgSender(), "Ownable: caller is not the owner");
}



function _msgSender() internal view virtual returns (address) {
    return msg.sender;
}
