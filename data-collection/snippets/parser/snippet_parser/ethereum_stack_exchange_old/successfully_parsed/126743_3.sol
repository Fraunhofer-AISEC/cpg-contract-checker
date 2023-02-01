
    pragma solidity ^0.8.10;
    
contract AllSubs {



struct Subscription {
    address subscriber;
    uint start;
    uint nextPayment;
  }


mapping(address => mapping(uint => Subscription)) public subscriptions;  

uint totalSubscriptions; 

address[] allSubcribers; 
uint[] subscriptionList; 

function addSubscription(uint subscriptionID, uint startDate) public {

    if (subscriptions[msg.sender][0].start == 0){
        allSubcribers.push(msg.sender); 
        subscriptionList.push(subscriptionID);
    }

    subscriptions[msg.sender][subscriptionID].start = startDate; 
    subscriptions[msg.sender][subscriptionID].subscriber = msg.sender; 
    totalSubscriptions +=1;

   

    }


function getAllsubscriptions() public view returns (Subscription[] memory) {

        Subscription[] memory items = new Subscription[](totalSubscriptions);

        
        for(uint i = 0; i < allSubcribers.length; i++) {
            address subscriberAddress = allSubcribers[i];
            uint subscriptionID = subscriptionList[i];
            
            Subscription storage currentSubscription = subscriptions[subscriberAddress][subscriptionID];
            items[i] = currentSubscription;
        }

        return items;
    }


    }
