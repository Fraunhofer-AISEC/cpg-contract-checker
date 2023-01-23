struct Subscription {
    address subscriber;
    uint start;
    uint nextPayment;
  }

mapping(address => mapping(uint => Subscription)) public subscriptions;

function getAllsubscriptions() external view returns (Subscription[] memory) {

    Subscription[] memory items = new Subscription[](totalLoans);
    for(uint256 i = 0; i < totalSubscriptions; i++) {
        uint256 currentId = i;
        LoanRequest storage currentItem = subscriptions[allSubcribers[currentId]][currentId];
        items[currentId] = currentItem;
        currentId += 1;
    }

    return items;
}
