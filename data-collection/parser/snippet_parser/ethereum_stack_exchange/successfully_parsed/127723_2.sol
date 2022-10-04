function fetchMysubscription(address user, uint256 planId)
    external
    view
    returns (Subscription memory)
{
    return AllSubscriptions[user][planId];
}
