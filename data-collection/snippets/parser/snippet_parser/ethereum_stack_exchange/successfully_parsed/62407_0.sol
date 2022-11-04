function subscribeToPolicy(address policyAddress, uint userId) public payable {
    uint policyPrice = 0.1 ether;
    require (msg.value >= policyPrice);
    userMapping[userId].mySubscriptions.push(policyAddress);
}
