(uint80 currentRoundId, int256 currentPrice) = _getPriceFromOracle();

oracleLatestRoundId = uint256(currentRoundId);
