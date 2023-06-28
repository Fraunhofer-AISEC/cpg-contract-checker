    function createNewSubscription(address vrfCoordinator, uint64 subId) public onlyOwner {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinator);
        s_subscriptionId = COORDINATOR.createSubscription();
        COORDINATOR.addConsumer(subId, address(this));
    }
