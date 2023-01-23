contract Campaign {
struct Request {
    string description;
    uint value;
    address recipient;
    bool complete;
    uint approvalCount;
    mapping(address => bool) approvals;
}

uint numRequests;
mapping (uint => Request) requests;

function createRequest(string memory description, uint value, address recipient) 
public restricted {            
    Request storage r = requests[numRequests++];
    r.description = description;
    r.value = value;
    r.recipient = recipient;
    r.complete = false;
    r.approvalCount = 0;
 }
}

function getSummary() public view returns (uint, uint, uint, unit, address) {
return (
  minimumContribution,
  address(this).balance,
  requests.length, 
  approversCount,
  manager
 );
}
