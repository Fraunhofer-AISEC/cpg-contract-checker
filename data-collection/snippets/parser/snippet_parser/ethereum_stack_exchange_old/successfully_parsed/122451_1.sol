 contract Campaign {
 struct Request{
     string description;
     uint value;
     address payable recipient;
     bool complete;
     uint approvalCount;
     mapping (address => bool) approvals;
 }
 Request[] public requests;
 address public manager;
 uint public minimumContribution;
 mapping (address => bool) approvers;

uint approversCount;
 uint index;

 modifier restricted(){
     require(msg.sender == manager);
     _;
 }

 constructor(uint minimum, address creator){
     manager = creator;
     minimumContribution = minimum;
     index = 0;
 }

 function contribute() public payable {
     require(msg.value >= minimumContribution);
     approvers[msg.sender] = true;
     approversCount++;
 }

 function createRequest(string memory description, uint value, address payable recipient) 
    public restricted {
        uint requestLength = requests.length;
        requests.push();
        Request storage newRequest = requests[requestLength];
        newRequest.description = description;
        newRequest.value = value;
        newRequest.recipient = recipient;
        newRequest.complete = false;

 }

function approveRequests(uint id) public {
    require(approvers[msg.sender]);
    require(!requests[id].approvals[msg.sender]);
    requests[id].approvalCount++;
    requests[id].approvals[msg.sender] = true;

}

function finalizeRequest(uint id) public restricted {
    require(!requests[id].complete);
    require(requests[id].approvalCount > (approversCount / 2));
    requests[id].complete = true;
    requests[id].recipient.transfer(requests[id].value);
}
}