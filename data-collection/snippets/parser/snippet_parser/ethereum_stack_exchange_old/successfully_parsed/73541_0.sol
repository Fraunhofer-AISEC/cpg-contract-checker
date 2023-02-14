struct Subscription {
    address subscriberAddress; 
    uint256 timeOfLastCharge; 
    uint256 nonce;
}

mapping(address => Subscriptions) public subscriptionRegistry; 



function initiateSubscription (address _subscriberAddress) external {

    require(msg.sender == contractManager, "You are not authorized to call this function.");
    require(subscriptionRegistry[_subscriberAddress].subscriberAddress == address(0), "A subscription already exists for this address.");

    Subscription storage newSubscription = Subscriptions[_subscriberAddress];
    newSubscription.subscriberAddress = _subscriberAddress;
    newSubscription.timeOfLastCharge = now;
    newSubscription.nonce = currentNonce;

    tokenContract.transferFrom(_subscriberAddress, merchant, subscriptionPrice);

    emit subscriptionEvent(_subscriberAddress, subscriptionPrice, billingInterval);
}
