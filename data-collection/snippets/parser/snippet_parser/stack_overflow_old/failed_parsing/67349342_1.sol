struct Request {
    string description;
    uint value;
    address recipient;
    bool complete;
    uint approvalCount;
    mapping(address => bool) approvals;
}

Request[] public requests;
address public manager;

uint public minimumContribution;

mapping(address => bool) public approvers;

uint public approversCount;

modifier restricted() {
    require(msg.sender == manager);
    _;
}

constructor(uint minimum, address creator){
    
    manager = creator;
    minimumContribution = minimum;
}

function contribute() public payable {
    require(msg.value > minimumContribution);
    
    approvers[msg.sender] = true;
    approversCount++;
}

uint numRequest;


function creatRequest(string memory description, uint value, address recipient) public restricted {
            
    Request storage newRequest = requests[numRequest++];
       newRequest.description = description;
       newRequest.value = value;
       newRequest.recipient = recipient;
       newRequest.complete = false;
       newRequest.approvalCount = 0;
    
}

function approveRequest(uint index) public {
    Request storage request = requests[index];
    require(approvers[msg.sender]);
    require(!request.approvals[msg.sender]);
    
    request.approvals[msg.sender] = true;
    request.approvalCount++;
}


function finalizeRequest(uint index) public restricted {
    Request storage request = requests[index];
    
    require(request.approvalCount > (approversCount / 2));
    require(!request.complete);
    
    payable(request.recipient).transfer(request.value);
    request.complete = true;
}
