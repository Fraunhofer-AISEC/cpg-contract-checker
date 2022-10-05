
    pragma solidity ^0.8.10;
    
    contract AllSubscriptions {



struct Subscription {
    address subscriber;
    uint start;
    uint nextPayment;
  }


mapping(address => mapping(uint => Subscription)) public subscriptions;

uint totalSubscriptions; 

function addSubscription(uint subscriptionID, uint startDate) public {

    subscriptions[msg.sender][subscriptionID].start = startDate; 
    subscriptions[msg.sender][subscriptionID].subscriber = msg.sender; 
    totalSubscriptions +=1;
    }

function getAllsubscriptions() public view returns (Subscription[] memory) {

        Subscription[] memory items = new Subscription[](totalSubscriptions);

        
        for(uint i = 0; i < totalSubscriptions; i++) {
            uint subscriptionID = i;
            
            Subscription storage currentSubscription = subscriptions[msg.sender][subscriptionID];
            items[subscriptionID] = currentSubscription;
            subscriptionID += 1;
        }

        return items;
    }

    }
