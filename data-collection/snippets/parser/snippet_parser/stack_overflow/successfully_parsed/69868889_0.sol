contract KeepOwner {
    address private _owner;
    constructor() {
        _owner = msg.sender;
    }

    function isOwner(address likeOwner) public view returns (bool) {
        return likeOwner == _owner;
    }
}
