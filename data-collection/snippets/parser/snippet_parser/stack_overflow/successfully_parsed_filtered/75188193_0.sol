constructor(address _consumer, uint64 _subscriptionId, address _oracle)
        VRFConsumerBaseV2(_consumer)
        ConfirmedOwner(_oracle)
    {
        COORDINATOR = VRFCoordinatorV2Interface(
            _consumer
        );
        s_subscriptionId = _subscriptionId;
    }
