struct CampaignStruct {
  ...
  address funders[];
  bool exists;
}

mapping(bytes32 => CampaignStruct) public campaignStructs;
bytes32[] public campaignIndex;

struct FunderStruct {
  ...
  bool exists;
}

mapping(address => FunderStruct) public funderStructs;
address[] public funderIndex;

function getCampaignCount() public constant returns(uint count) {
   return campaignIndex.length;
}

function getFunderCount() public constant returns(uint count) {
   return funderIndex.length;
}

function getCampaignAtIndex(uint row) public constant returns(<details>) {}

function getCampaignFunderCount(bytes32 campaignId) public constant returns(uint count) {
   return campaignStructs[campaignId].funders.length;
}

function getCampaignFunderAtIndex(bytes32 campaignId, uint row) public constant returns(address funder)

{
   return campaignStructs[campaignId].funders[row];
}
