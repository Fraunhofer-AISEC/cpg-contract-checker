contract Campaign {
    struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        mapping (address => bool) approvals;
        uint approvalCount;
    }
    address public manager;
    uint numRequests;
    mapping (uint => Request) requests;
    
    
    modifier restrictedToManager() {
        require(msg.sender == manager);
        _;
    }
    
    constructor(uint minimum, address creator) {
        manager = creator;
        minimumContribution = minimum;
    }
    
    function createRequest(string calldata description, uint value, address payable recipient) public restrictedToManager {
        
       Request storage newRequest = requests[numRequests];
       
       numRequests ++;
       
       newRequest.description = description;
       newRequest.value = value;
       newRequest.recipient = recipient;
       newRequest.approvalCount = 0;
    }
}