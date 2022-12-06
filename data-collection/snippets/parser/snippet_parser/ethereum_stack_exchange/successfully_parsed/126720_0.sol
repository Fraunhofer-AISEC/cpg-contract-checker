uint256 seed; 

function getSeedValue() public view returns (uint256) {
    return seed;
}

function setSeedValue(uint256 _seed) public {
    seed = _seed; 
    }
