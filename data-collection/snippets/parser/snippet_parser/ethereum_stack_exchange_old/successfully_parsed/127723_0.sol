struct Subscription {
        address payable subscriber;
        uint start;
        uint nextPayment;
        bool activated;
    }

    
     
    mapping(address => mapping(uint => Subscription)) private AllSubscriptions;

    
    function fetchMysubscription(uint256 planId) external view returns(
            address subscriber,
            uint start,
            uint nextPayment,
            bool activated
    ) {

        Subscription storage currentSubscription = AllSubscriptions[msg.sender][planId];

        if(currentSubscription.subscriber == msg.sender) {
            return (
            currentSubscription.subscriber,
            currentSubscription.start,
            currentSubscription.nextPayment,
            currentSubscription.activated
           );
        }
           
    }
