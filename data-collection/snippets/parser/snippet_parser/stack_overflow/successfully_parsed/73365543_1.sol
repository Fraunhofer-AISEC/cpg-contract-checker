Request[] public pendingRequests;


function createRequest(string memory description, uint value, address payable recipient) public {
        
        
        Request memory newRequest=Request({
            description:description,
            value:value,
            recipient:recipient,
            complete:false,

        });
        pendingRequests.push(newRequest);
  }
