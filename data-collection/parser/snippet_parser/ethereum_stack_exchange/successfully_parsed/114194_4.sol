uint256 public functionToCall = 0;

function checkUpkeep(
        bytes calldata checkData
    ) external view override returns (
        bool upkeepNeeded, bytes memory performData
    ) {
        if (getPrice() == roundMoonPrice[coinRound]) {
            upkeepNeeded = true;
            functionToCall = 0;
            return (true, performData) ;
        } if (roundWinningIndex[coinRound].length != 0) {
            upkeepNeeded = true;
            functionToCall = 1;
            return (true, performData);
        }

}