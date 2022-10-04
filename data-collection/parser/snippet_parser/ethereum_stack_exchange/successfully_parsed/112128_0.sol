contract ReentrancyGuard {

uint256 private _guardCounter;

constructor () internal {
    
    
    _guardCounter = 1;
}


modifier nonReentrant() {
    _guardCounter += 1;
    uint256 localCounter = _guardCounter;
    _;
    require(localCounter == _guardCounter);
}
}