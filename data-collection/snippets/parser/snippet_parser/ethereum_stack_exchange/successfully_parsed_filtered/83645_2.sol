pragma solidity ^0.6.6;

contract campaignFactory{
    address[] public deployedCampaigns;

    function createCampaign(uint min) public {
        Campaign newCampaign = new Campaign(min, msg.sender);
        deployedCampaigns.push(address(newCampaign));
    }

    function getDeployedCampaigns() public view returns (address[] memory){
        return deployedCampaigns;
    }
}

contract Campaign{
    struct Request{
        string description;
        uint value;
        address payable recipient;
        bool compelete;
        uint approvalCount;
        mapping(address => bool) hasVoted;
    }

    Request[] public requests;
    address public manager;
    uint public minContribution;
    mapping(address => bool) public approvers;
    uint public approversCount;

    modifier onlyManager(){
        require(msg.sender == manager);
        _;
    }

    constructor (uint min,address creator) public{
        manager = creator;
        minContribution = min;
    }

    function contribute() public payable{
        require(msg.value > minContribution);

        approvers[msg.sender] = true;
        approversCount++;
    }

    function createRequest(string memory description, uint value, address payable recipient) public onlyManager {
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            compelete: false,
            approvalCount: 0
        });

        requests.push(newRequest);
    }

    function approveRequest(uint index) public {
        Request storage thisRequest = requests[index];

        require(approvers[msg.sender]);
        require(!thisRequest.hasVoted[msg.sender]);

        thisRequest.hasVoted[msg.sender] = true;
        thisRequest.approvalCount++;
    }

    function finalizeRequest(uint index) public onlyManager{
        Request storage thisRequest = requests[index];

        require(thisRequest.approvalCount > (approversCount / 2));
        require(!thisRequest.compelete);

        thisRequest.recipient.transfer(thisRequest.value);
        thisRequest.compelete = true;
    }

    function getSummary() public view returns(uint, uint, uint, uint, address){
        return(
            minContribution,
            address(this).balance,
            requests.length,
            approversCount,
            manager
            );
    }

    function getRequestsCount() public view returns (uint){
        return requests.length;
    }
}
