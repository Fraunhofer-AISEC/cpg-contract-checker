pragma solidity ^0.4.25;

contract CampaignFact {
    address[] public deployedCampaigns;

function createCampaign(uint min) public {
    address newC = new Campaign(min, msg.sender);
    deployedCampaigns.push(newC);
}

function getDeployedCampaigns() public view returns (address[] memory) {
    return deployedCampaigns;
  }
}
contract Campaign {

struct Request {
    string description;
    uint value;
    address recipient;
    bool complete;
    uint approvalCount;
    mapping (address => bool) approvals;
}

Request[] public requests;
address public manager;
uint public minimumContribution;
mapping (address => bool) public approvers;
uint public approversCount;

modifier restrict() {
    require(msg.sender == manager);
    _;
}

constructor(uint min, address creator) public {
    manager = creator;
    minimumContribution = min;
}

function contribute() public payable {
    require(msg.value > minimumContribution, "Error: You do not have enough money. You are poor.");
    approvers[msg.sender] = true;
    approversCount++;
}

function createRequest(string memory desc, uint val, address rec) public restrict {
    
    require(approvers[msg.sender]);

    Request memory newReq = Request({
        description: desc,
        value: val,
        recipient: rec,
        complete: false,
        approvalCount: 0
    });

    requests.push(newReq);
}

function approveRequest(uint index) public {
    Request storage r = requests[index];

    
    require(approvers[msg.sender]);

    
    require(!r.approvals[msg.sender]);

    r.approvals[msg.sender] = true;
    r.approvalCount++;
}

function finalizeRequest(uint index) public restrict {

    Request storage r = requests[index];

    require(r.approvalCount > (approversCount / 2) );
    require(!r.complete);       

    r.recipient.transfer(r.value);
    r.complete = true;
  }
}
