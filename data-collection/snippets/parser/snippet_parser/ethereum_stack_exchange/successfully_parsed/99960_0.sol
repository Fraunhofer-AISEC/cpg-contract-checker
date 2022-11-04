pragma solidity ^0.8.4;

import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Price {

    
    receive() external payable {
    }
    
    address payable owner;
    
        AggregatorV3Interface internal priceFeed;

    
    constructor() public payable {
        priceFeed = AggregatorV3Interface(address(0x9326BFA02ADD2366b30bacB125260Af641031331));
    }

    function getThePrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
    
    uint current_price = uint(getThePrice());


    
    
}
