constructor(address _priceFeed, uint64 _subscriptionId, address vrfCoordinator)
        VRFConsumerBaseV2(vrfCoordinator)
    {
        priceFeed = AggregatorV3Interface(_priceFeed);
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        owner = msg.sender;
        usdEntryFee = 50 * (10**18);
        subscriptionId = _subscriptionId;
    }
