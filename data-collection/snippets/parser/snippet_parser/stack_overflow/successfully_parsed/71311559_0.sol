pragma solidity ^0.4.17;

contract Campaign {

    struct Request  {
        string description;
        uint value;
        address recipient;
        bool complete;
    }

    Request[] public requests;
    address public manager;
    uint public minimumContirbution;
    address[] public approvers;

    modifier restricted() {
        require (msg.sender == manager);
        _;
    }

    function Campaign (uint minimum) public {
        manager = msg.sender;
        minimumContirbution = minimum;
    }

    function contribute () public payable {
        require(msg.value > minimumContirbution);
        approvers.push(msg.sender);
    }

    function createRequest(string description, uint value, address recipient) restricted public  {
        Request memory newRequest = Request({ 
            description: description,
            value: value,
            restricted: restricted,
            complete: false
        });

        requests.push(newRequest);
    }

}
