
function createNewSubscription() private onlyOwner {
    
    address[] memory consumers = new address[](1);
    consumers[0] = address(this);
    s_subscriptionId = COORDINATOR.createSubscription();
    
    COORDINATOR.addConsumer(s_subscriptionId, consumers[0]);
}
