
pragma solidity ^0.8.9;

contract CampaignFactory {
  address[] public deployedCampaigns;

  function createCampaign(uint minimum) public {
     Campaign newCompaign  = new Campaign(minimum, msg.sender);
     deployedCampaigns.push(address(newCompaign));
  }

  function getDeployedCampaigns() public view returns(address[] memory){
     return deployedCampaigns;
  }

}

contract Campaign {

  struct Request {
    string description;
    uint amount;
    address recipient;
    bool complete;
    uint approvalCount;
    mapping (address => bool) approvals;
  }
  mapping(address => bool) approvers;
  uint approversCount;
  Request[] requests;

  address public manager;
  uint public minimumContribution;

  modifier restricted() {
    require(msg.sender == manager);
    _;
  }
  constructor(uint minimum, address creator) {
    manager = creator;
    minimumContribution = minimum;
  }

  function contribute() public payable {
    require(msg.value > minimumContribution);
    approvers[msg.sender] = true;
    approversCount++;
  }

  function createRequest(string memory description, uint amount, address recipient) public 
   restricted{

     Request storage newRequest = requests.push();
     newRequest.description = description;
     newRequest.amount = amount;
     newRequest.recipient = recipient;
     newRequest.complete = false;
     newRequest.approvalCount = 0;    
  }
  ...
}
