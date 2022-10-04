    struct Request{
            string description;
            uint value;
            address recipient;
            bool complete;
            uint approvalsCount;
            mapping(address => bool) approvals;
        }
        
    uint numRequests;
    mapping (uint => Request) requests;
    
    function createRequest (string memory description, uint value,
            address recipient) public{
                Request storage r = requests[numRequests++];
                r.description = description;
                r.value = value;
                r.recipient = recipient;
                r.complete = false;
                r.approvalsCount = 0;
            
        }
