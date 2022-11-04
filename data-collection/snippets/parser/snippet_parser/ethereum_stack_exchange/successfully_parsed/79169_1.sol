pragma solidity 0.5.16;

import "./HitchensUnorderedKeySet.sol";

contract Claims {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    struct Claim {
        uint scheme;
        address issuer;
        bytes signature;
        bytes data;
        bytes url;
    }    

    struct Topic {
        HitchensUnorderedKeySetLib.Set claimIdSet;
    }

    HitchensUnorderedKeySetLib.Set topicIdSet;

    mapping(bytes32 => Topic) topics; 
    mapping(bytes32 => Claim) public claims;
    mapping(bytes32 => bool) public usedSignatureHashes;

    function newTopic(bytes32 topicId) public {
        topicIdSet.insert(topicId);
    }

    function removeTopic(bytes32 topicId) public {
        Topic storage t = topics[topicId];
        require(t.claimIdSet.count() == 0, "Cannot delete topic with claims. Remove the claims first.");
        delete topics[topicId];
        topicIdSet.remove(topicId);
    }

    function newClaim(bytes32 topicId, bytes32 claimId, uint scheme, address issuer, bytes memory signature, bytes memory data, bytes memory url) public {
        require(topicIdSet.exists(topicId), "Topic ID not found.");
        require(!usedSignatureHashes[keccak256(signature)], "Claim signature was used before.");
        usedSignatureHashes[keccak256(signature)] = true;
        Topic storage t = topics[topicId];
        t.claimIdSet.insert(claimId); 
        Claim storage c = claims[claimId];
        c.scheme = scheme;
        c.issuer = issuer;
        c.signature = signature;
        c.data = data;
        c.url = url;
    }

    function removeClaim(bytes32 topicId, bytes32 claimId) public {
        Topic storage t = topics[topicId];
        t.claimIdSet.remove(claimId); 
        delete claims[claimId];
    }

    
    function topicClaimCount(bytes32 topicId) public view returns(uint) {
        return topics[topicId].claimIdSet.count();
    }

    function topicClaimIdAtIndex(bytes32 topicId, uint index) public view returns(bytes32) {
        return topics[topicId].claimIdSet.keyAtIndex(index); 
    }

    
    function arbitraryKey() public view returns(bytes32 key) {
        key = keccak256(abi.encodePacked(block.number));
    }

}
