uint256 favouriteNumber; 

function store(uint256 _favouriteNumber) public {
    favouriteNumber = _favouriteNumber;

}

function retrieve() public view returns(uint256) {
    return favouriteNumber;
}
