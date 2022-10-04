pragma solidity >=0.4.17 <0.7.0;

contract CampaignFactory{
    Campaign[] public deployedCampaigns;

    function createCampaign(uint minimum) public{
        Campaign newCampaign = new Campaign(minimum,msg.sender);
        deployedCampaigns.push(newCampaign);

    }

    function getDeployedCampaigns() public view returns ( Campaign[] memory) {
        return deployedCampaigns;
    }
}


contract Campaign{

    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping( address => bool ) approvals;


    }


 Request[]  public requests;           
 address public manager;                     
 uint public minimumContribution;                      
 mapping( address => bool) public approvers;                       
 uint public contributersCount;                                         

    modifier restricted(){                       
        require(msg.sender == manager);                   
        _;                
    }                   

  
    constructor(uint minimum,address creator) public {          
        manager = creator;
        minimumContribution = minimum;

    }


    function contribute() public payable{
        require(msg.value > minimumContribution);

        approvers[msg.sender] = true;
        contributersCount++;

    }



    function createRequest(string memory description, uint value, address recipient ) public restricted() {
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0

        });

        requests.push(newRequest);

    }

    function approveRequest( uint index) public{
        Request storage request_index = requests[index];

        require(approvers[msg.sender]);

        require(!request_index.approvals[msg.sender]);

        request_index.approvals[msg.sender] = true;

        request_index.approvalCount++;

    }

    function finalizeRequest(uint  index) public payable restricted {
        Request storage  request = requests[index];
        require(request.approvalCount > (contributersCount / 2));
        require(!request.complete);

        
        
        
        payable(request.recipient).transfer(request.value);
        request.complete = true;

    }

}
