modifier policyExists(address policyAddress, uint userId) {
    for(uint j=0; j<userMapping[userId].mySubscriptions.length+1; j++){
        if (userMapping[userId].mySubscriptions[j] == policyAddress ){
            emit Log("Policy already purchased");
            revert();
        }
    }
    _;
}
function subscribeToPolicy(address policyAddress, uint userId)            
policyExists(policyAddress, userId) public payable {
    uint policyPrice = 0.1 ether;
    require (msg.value >= policyPrice);
    userMapping[userId].mySubscriptions.push(policyAddress);
}
