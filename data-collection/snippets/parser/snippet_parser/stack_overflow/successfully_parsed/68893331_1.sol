

pragma solidity ^0.8.7;

contract CampaignFactory {
    address[] public deployedCampaigns;

    function createCampaign(uint minimum) public {
        address newCampaign = address(new Campaign(minimum, msg.sender));
        deployedCampaigns.push(newCampaign);
    }

    function getDeployedCampaigns() public view returns (address[] memory) {
        return deployedCampaigns;
    }
}

contract Campaign {
    struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }


    uint numRequests;
    mapping (uint => Request) public requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    constructor (uint minimum, address creator) {
         manager = creator;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);
    
        approvers[msg.sender] = true;
        approversCount++;
    }

    function createRequest (string memory description, uint value,
        address payable recipient) public{
            Request storage r = requests[numRequests++];
            r.description = description;
            r.value = value;
            r.recipient = recipient;
            r.complete = false;
            r.approvalCount = 0;
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
    
        request.recipient.transfer(request.value);
        request.complete = true;
    }
    
}
