    constructor() public payable {
        priceFeed = AggregatorV3Interface(address(0x9326BFA02ADD2366b30bacB125260Af641031331));
        current_price = uint(getThePrice());
    }
