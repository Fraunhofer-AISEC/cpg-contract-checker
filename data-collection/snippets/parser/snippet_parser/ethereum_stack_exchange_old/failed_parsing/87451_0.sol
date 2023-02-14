pragma solidity >=0.5.0;

contract Campaign {
    struct Request {
        string description;

        
        mapping(address => bool) approvals;

    }
    constructor(uint256 minimum, address creator) {
        ...
    }

    function createRequest(string memory description) public onlyManager {
        Request memory newRequest = Request({ 

            

            description : description

        });
    }
    ...
