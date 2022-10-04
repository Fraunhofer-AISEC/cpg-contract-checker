
pragma solidity ^0.8.13;
contract CrowdFunding{
    mapping(address=>uint) public contributors;
    address public manager;
    uint public minContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmmount;
    uint public noOfContributors;

    struct Request{
        string description;
        **address payable recipient;**
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }

....
Later this address payable is passed onto a function

function createRequests(string memory _description, address payable _recipient, uint _value) public onlyManager{
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description=_description;
        newRequest.recipient=_recipient;
        newRequest.value=_value;
        newRequest.completed=false;
        newRequest.noOfVoters=0;
    }
