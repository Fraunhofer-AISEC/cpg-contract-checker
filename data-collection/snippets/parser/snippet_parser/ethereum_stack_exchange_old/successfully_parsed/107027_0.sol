pragma solidity >=0.8.4;

contract Contract {

    struct Requests {
        string description;
        uint value;
        address recipient;
        bool complete;
        mapping(address => bool) sender;
        uint approvalCount;
    }

    Requests[] public requests;

    function createRequest(string memory d, uint v, address r) public {
        Requests storage newRequest = requests.push();
        newRequest.description = d;
        newRequest.value = v;
        newRequest.recipient = r;
        newRequest.complete = false;
        newRequest.approvalCount = 0;
        newRequest.sender[msg.sender] = true;
    }
}
