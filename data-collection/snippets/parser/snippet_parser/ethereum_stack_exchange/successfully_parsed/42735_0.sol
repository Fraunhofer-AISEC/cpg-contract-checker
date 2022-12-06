pragma solidity ^0.4.17;

contract CampaignFactory {

    address[] public deployedCampaignsAddress;
    address[] public managersAddress;

    function createCampaign(string description, uint minimumContribution, string campaignCategory, string endDate) public {
        Campaign newlyCreatedCampaign = new Campaign(description, minimumContribution, campaignCategory, endDate, msg.sender);
        deployedCampaignsAddress.push(newlyCreatedCampaign);
        managersAddress.push(msg.sender);
    }

    function getDeployedCampaigns() public view returns (address[]) {
        return deployedCampaignsAddress;
    }

    function getManagersAddress() public view returns (address[]) {
        return managersAddress;
    }
}

contract Campaign {

    struct NewCampaignType {
        string description;
        uint minimumContribution;
        string campaignCategory;
        string endDate;
        address managerAddress;
    }

    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    NewCampaignType[] public campaignDetails;
    Request[] public requests;
    mapping(address => bool) public approvers;
    uint public approversCount;
    address public currentManager;

    modifier restricted() {
        require(msg.sender == currentManager);
        _;
    }

    function Campaign(string description, uint minimumContribution, string campaignCategory, string endDate, address managerAddress) public {
        NewCampaignType memory createCampaign = NewCampaignType({
            description: description,
            minimumContribution: minimumContribution,
            campaignCategory: campaignCategory,
            endDate: endDate,
            managerAddress: managerAddress
        });
        campaignDetails.push(createCampaign);
    }

    function contribute() public payable {
        require(msg.value > campaignDetails[0].minimumContribution);
        approvers[msg.sender] = true;
        approversCount++;
    }

    function createRequest(string description, uint value, address recipient) public restricted {
        Request memory newRequest = Request({
           description: description,
           value: value,
           recipient: recipient,
           complete: false,
           approvalCount: 0
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

        require(request.approvalCount > (approversCount / 2));
        require(!request.complete);

        request.recipient.transfer(request.value);
        request.complete = true;
    }

    function getSummary() public view returns (
      uint, uint, uint, uint, address
      ) {
        return (
          campaignDetails[0].minimumContribution,
          this.balance,
          requests.length,
          approversCount,
          campaignDetails[0].managerAddress
        );
    }

    function getRequestsCount() public view returns (uint) {
        return requests.length;
    }
}
