import "./VRFSetup.sol";

contract SubscriptionManager is VRFSetup {
    address[] private _consumers;

    constructor() {}

    function addConsumer(address consumerAddress) external onlyOwner {
        COORDINATOR.addConsumer(_subscriptionid, consumerAddress);
    }

    
    function status() external view returns(
        uint96 balance,
        uint64 reqCount,
        address subOwner,
        address[] memory consumers) 
    {
        (balance, reqCount, subOwner, consumers) = COORDINATOR.getSubscription(_subscriptionid);
    }
}
