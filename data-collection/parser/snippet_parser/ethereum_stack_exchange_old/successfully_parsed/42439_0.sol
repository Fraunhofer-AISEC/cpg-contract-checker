pragma solidity ^0.4.17;

contract CampaignFactory {

struct NewCampaignType {
string description;
uint minimumContribution;
string campaignCategory;
string endDate;
address manager;
}

address[] public deployedCampaigns;

function createCampaign(string description, uint minimumContribution, string campaignCategory, string endDate) public {
address newlyCreatedCampaign = new Campaign(description, minimumContribution, campaignCategory, endDate, msg.sender);
deployedCampaigns.push(newlyCreatedCampaign);
}

function getDeployedCampaigns() public view returns (address[]) {
return deployedCampaigns;
}
}

contract Campaign {

struct NewCampaignType {
string description;
uint minimumContribution;
string campaignCategory;
string endDate;
address manager;
}

struct Request {
string description;
uint value;
address recipient;
bool complete;
uint approvalCount;
mapping(address => bool) approvals;
}

NewCampaignType[] public campaigns;
Request[] public requests;
mapping(address => bool) public approvers;
uint public approversCount;

modifier restricted() {
require(msg.sender == campaigns.manager);
_;
}

function Campaign(string description, uint minimumContribution, string campaignCategory, string endDate, address manager) public {
NewCampaignType memory createCampaign = NewCampaignType({
description: description,
minimumContribution: minimumContribution,
campaignCategory: campaignCategory,
endDate: endDate,
manager: manager
});
campaigns.push(createCampaign);
}

function contribute() public payable {
require(msg.value > campaigns.minimumContribution);

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
campaigns.minimumContribution,
this.balance,
requests.length,
approversCount,
campaigns.manager
);
}

function getRequestsCount() public view returns (uint) {
return requests.length;
}
}
