
pragma solidity ^0.7.1;

contract Campaign {
    struct Request {
        uint value;
        mapping(address => bool) approvals;
    }

    Request[] public requests;
    address public manager;
    uint public minimumContribution;
    uint public numRequests;

    constructor(uint minimum) {
        manager = msg.sender;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);
    }

    function createRequest(uint value) public returns (uint requestId) {
        requestId = numRequests++;
        Request storage r = requests[requestId];
        r.value = value;
        r.approvals[msg.sender] = true;
    }
}
