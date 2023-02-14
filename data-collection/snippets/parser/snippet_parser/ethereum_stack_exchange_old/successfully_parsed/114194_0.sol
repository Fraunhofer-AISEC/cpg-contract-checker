function checkUpkeep(
    bytes calldata checkData
) external view override returns (
    bool upkeepNeeded, bytes memory performData
) {
    if (getPrice() == roundMoonPrice[coinRound]) {
        upkeepNeeded = true;
        return (true, performData) ; 
    } if (roundWinningIndex[coinRound].length != 0) {
        upkeepNeeded = true;
        return (true, performData);
    }
    
}

function performUpkeep(bytes calldata  performData) external override {
    setTime();
}
