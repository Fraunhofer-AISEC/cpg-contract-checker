pragma solidity ^0.5.14;

contract Campaign {
    struct Request {
        string description;
        uint value;
        address payable recipient;
        bool complete;
        uint approvalCount;
        mapping (address => bool) approvals;
    }

    address public manager;
    uint public minimumContribution;
    
    mapping (address => bool) public approvers;
    Request[] public requests;
    uint public approversCount;


    constructor(uint minimum) public {
        manager=msg.sender;
        minimumContribution=minimum;
    }

    function contribute() public payable {
        require(msg.value>minimumContribution);
        
        approvers[msg.sender]=true;
        approversCount++;
    }

    function createRequest(string memory description,uint value,address payable recipient) public restricted {
        
        Request memory newRequest=Request({description:description,value:value,recipient:recipient,complete:false,approvalCount:0});
        requests.push(newRequest);

    }

    function approveRequest(uint index) public {
        Request storage request=requests[index];

        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);
        request.approvals[msg.sender]=true;
        request.approvalCount++;
    } 

    function finalizeRequest(uint index) public restricted payable{
        Request storage request = requests[index];

        require(request.approvalCount>=(approversCount/2));
        require(!request.complete);
        request.recipient.transfer(request.value);
        request.complete=true;

    } 

    modifier restricted() {
        require (msg.sender == manager);
        _;
    }
}
