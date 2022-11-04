struct Request{
    uint256 value;
    mapping(address => bool) approvals;
}
            
uint256 numRequests;
mapping (uint256 => Request) requests;
        
function createRequest (uint256 value) public{
    Request storage r = requests[numRequests++];
    r.value= value;
}
