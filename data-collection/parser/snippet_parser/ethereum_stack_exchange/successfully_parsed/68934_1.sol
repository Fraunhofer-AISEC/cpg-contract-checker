pragma solidity 0.5.1;



import "./HitchensUnorderedKeySet.sol";

contract CrowdFunding {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    mapping(address => uint) public funderTotalContributions;

    struct Campaign {
        uint totalRaised;
        address beneficiary;
        mapping(address => uint) funderContributions;
        HitchensUnorderedKeySetLib.Set funderSet;
    }

    mapping(bytes32 => Campaign) campaigns;
    HitchensUnorderedKeySetLib.Set campaignSet;

    function newCampaign() public {
        bytes32 campaignId = genCampaignId();
        campaignSet.insert(campaignId);
        campaigns[campaignId].beneficiary = msg.sender;
    }
    function contribute(bytes32 campaignId) public payable {
        require(campaignSet.exists(campaignId), "Campaign does not exist.");
        Campaign storage c = campaigns[campaignId];
        if(!c.funderSet.exists(addressToBytes32(msg.sender))) c.funderSet.insert(addressToBytes32(msg.sender));
        c.funderContributions[msg.sender] += msg.value;
        funderTotalContributions[msg.sender] += msg.value;
        c.totalRaised += msg.value;
    }
    function getCampaignFundsByAddress(address funder, bytes32 campaignId) public view returns(uint) {
        return campaigns[campaignId].funderContributions[funder];
    }
    function getCampaignInfo(bytes32 campaignId) public view returns(uint, address, uint) {
        require(campaignSet.exists(campaignId), "Not a campaign.");
        Campaign storage c = campaigns[campaignId];
        return (c.totalRaised, c.beneficiary, c.funderSet.count());
    }
    function getCampaignAtIndex(uint index) public view returns(bytes32) {
        return campaignSet.keyAtIndex(index);
    }
    function getCampaignFunderAtIndex(bytes32 campaignId, uint index) public view returns(address) {
        require(campaignSet.exists(campaignId));
        return bytes32ToAddress(campaigns[campaignId].funderSet.keyAtIndex(index));
    }

    

    function genCampaignId() private view returns(bytes32 campaignId) {
        return keccak256(abi.encodePacked(this, msg.sender, campaignSet.count()));
    }

    

    function addressToBytes32(address a) private pure returns(bytes32) {
        return bytes32(uint(uint160(a)));
    }
    function bytes32ToAddress(bytes32 b) private pure returns(address) {
        return address(uint160(uint(b)));
    }

}
