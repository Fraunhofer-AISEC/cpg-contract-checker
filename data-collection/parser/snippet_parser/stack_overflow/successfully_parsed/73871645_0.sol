uint256 public favouriteNumber;

function store(unit256 _favouriteNumber) public {
    favouriteNumber = _favouriteNumber;
}

function retrieve() public view returns(unit256) {
    return favouriteNumber;
}
