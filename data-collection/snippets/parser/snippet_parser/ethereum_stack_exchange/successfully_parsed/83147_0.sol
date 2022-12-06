pragma solidity ^0.6.0;

contract Campaign {
    Request[] public requests;
    address  public  manager;
    uint public minimumConstribution;
    mapping(address => bool ) public approvers;
    uint public approversCount;

    constructor(uint minimum) public {
        manager = msg.sender;
        minimumConstribution = minimum;
    }

    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    modifier restricted {
        require(msg.sender == manager);
        _;
    }



    function constribute() public payable {
        require(msg.value > minimumConstribution);

        approvers[msg.sender] = true;

        approversCount++;
    }

    function createRequest(string memory description, uint value, address recipient) public restricted {
        Request memory newRequest = Request({
            description : description,
            value : value,
            recipient : recipient,
            complete : false,
            approvalCount : 0
        });

        requests.push(newRequest);
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

        require(request.approvalCount > approversCount /2);

        require(!request.complete);

        request.recipient.transfer(request.value);  
   



        request.complete = true;


    }

}
