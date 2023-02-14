import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Example {
    AggregatorV3Interface internal priceFeed;

    
    constructor() {
        priceFeed = AggregatorV3Interface(
            0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e
        );
        owner = msg.sender;
    }

}
