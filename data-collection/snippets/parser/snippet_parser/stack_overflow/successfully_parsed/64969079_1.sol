 function paySubscribers() public{
       for (uint i=0; i<subscribers.length; i++) {
          address payable currAddress = subscribers[i];
          currAddress.transfer(balances[currAddress]);
      }
    
    }
