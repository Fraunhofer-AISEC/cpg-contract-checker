
pragma solidity ^0.6.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function convertEthToUsd(
        uint256 amount,
        AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * amount);
    }
}
