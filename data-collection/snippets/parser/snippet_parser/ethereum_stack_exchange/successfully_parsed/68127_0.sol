pragma solidity >=0.4.17;

contract factoryCampaign {

    Campaign[] public deployedCampaign;

    function createCampaign (uint256 minimumContribution) public {
        Campaign newCampaign = new Campaign(minimumContribution, msg.sender);
        deployedCampaign.push(newCampaign);
    }

    function getDeplyedCampaigns() public view returns(Campaign[] memory) {
        return deployedCampaign;        
    }
}

contract Campaign {

    struct Request {
        string description;
        uint256 value;
        address recipient;
        bool complete;
        uint256 approvalCount;
        mapping (address => bool) approvers;

    }
    address public manager;
    uint256 public minimumContribution;
    mapping(address=> bool) public approvers; 
    Request[] public requests;
    uint256 public approversCount;

    modifier restricted() {
        require (msg.sender == manager);
        _;
    }

     constructor (uint256 minimum, address creator) public {
         manager = creator;
         minimumContribution = minimum;
     }

     function contribute() public payable {
         require (msg.value > minimumContribution);
         approvers[msg.sender] = true;
         approversCount++;
     }

     function createRequest(string memory description, uint256 value, address recipient) public restricted {
         Request memory newRequest = Request({
             description: description,
             value: value,
             recipient: recipient,
             complete: false,
             approvalCount: 0
         });

         requests.push(newRequest);

     }

     function approveRequest(uint256 index) public {
         Request storage request = requests[index];
         require(approvers[msg.sender]);
         require(!request.approvers[msg.sender]);
         request.approvers[msg.sender] = true;
         request.approvalCount++;
     }

     function finalizeRequest(uint256 index) public payable {
         Request storage request = requests[index];
         require(!request.complete);
         require(request.approvalCount > (approversCount / 2));
         address payable recipient = address(uint160(request.recipient));
         recipient.transfer(request.value);
         request.complete = true;
     }

}
