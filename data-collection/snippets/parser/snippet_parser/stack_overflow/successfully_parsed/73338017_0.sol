contract Test {
    uint256[] private threshold = [1000, 2000, 3000];

    function setThreshold(uint256[] memory _threshold) public onlyOwner {       
        threshold = _threshold;
    }
}
