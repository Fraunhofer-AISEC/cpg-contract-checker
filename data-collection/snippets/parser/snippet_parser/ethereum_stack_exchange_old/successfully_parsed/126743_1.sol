
    pragma solidity ^0.8.10;
    
    contract SubscriptionContract {
    
     mapping(uint => Subscription) public subscriptionMap;
     mapping(address => UserData) public userMap; 
    
    
    struct Subscription {
        string subscriptionName; 
        address[] addresses;
    }
    
    struct UserData {
        uint subscriptionID; 
        uint index; 
    }
    
    function createSubscription(uint subscriptionID, string calldata name) public {
        subscriptionMap[subscriptionID].subscriptionName = name; 
    
    }
    
    
    function subscribeUser(uint subscriptionID) public {
    
        userMap[msg.sender].index = subscriptionMap[subscriptionID].addresses.length;
    
        subscriptionMap[subscriptionID].addresses.push(msg.sender);
        userMap[msg.sender].subscriptionID=subscriptionID;
        
    
    }
    
    
    
    function deleteUser(address userAddress) public {
    
        
        uint subscriptionID = userMap[userAddress].subscriptionID;
    
        
        uint index = userMap[userAddress].index;
    
        
    
        
        uint lastIndex= subscriptionMap[subscriptionID].addresses.length -1;
        subscriptionMap[subscriptionID].addresses[index] = subscriptionMap[subscriptionID].addresses[lastIndex]; 
        subscriptionMap[subscriptionID].addresses.pop(); 
    
    }
    
    
    function getAllSubscribers(uint subscriptionID) public view returns (address[] memory) {
    
        return subscriptionMap[subscriptionID].addresses;
    
    }
    
    }
