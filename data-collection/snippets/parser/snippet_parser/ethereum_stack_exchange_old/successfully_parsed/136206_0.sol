
pragma solidity ^0.8.9;


contract Campaign {
   address public manager;
   uint minimumContribution;
   mapping(address => bool) public approvers;
   Request[] public requests;

    struct Request {
      string description;
      uint value;
      address recipient;
      bool complete;
      uint approvalCount;
      mapping (address => bool) approvals;
    }

    uint requestsIndex;
    
    mapping (uint => Request) mapRequests;

    modifier restricted(){
        require(msg.sender == manager);
        _;
    }

   constructor(uint minimum){
       manager = msg.sender;
       minimumContribution = minimum;
    }

    function createRequest(string memory description, uint value, address recipient) public restricted {
      
       requestsIndex++;


       Request storage request = mapRequests[requestsIndex];
       request.description = description;
       request.value = value;
       request.recipient = recipient;
       request.complete = false;
       request.approvalCount = 0;

       requests.push();       
    }
}

