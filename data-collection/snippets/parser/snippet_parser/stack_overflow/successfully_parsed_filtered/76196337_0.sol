function createSubscription() external override returns (uint64 _subId) {
    s_currentSubId++;
    s_subscriptions[s_currentSubId] = Subscription({
        owner: msg.sender,
        balance: 0
    });
    emit SubscriptionCreated(s_currentSubId, msg.sender);
    return s_currentSubId;
}
