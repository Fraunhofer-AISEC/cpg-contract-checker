pragma solidity 0.4.24;

contract Bounties {

    

    bytes32[] public bountyList;

    struct Bounty {
        bool isBounty; 
        address issuer;
        uint256 fulfillmentAmount;
        uint256 balance;
        bool bountyOpen;
        Fulfillment[] fulfillments;
        mapping (bytes32 => bool) used;
    }

    struct Fulfillment {
        uint256 fulfillmentAmount;
        address fulfiller;
    }

    
    mapping(bytes32 => Bounty) public bountyStructs;

    function isBounty(bytes32 key) public view returns(bool isIndeed) {
        return bountyStructs[key].isBounty;
    }

    function newBounty(bytes32 key, address _issuer, uint amount) public payable returns(bool success) {
        require(!isBounty(key)); 
        bountyList.push(key);
        bountyStructs[key].isBounty = true;
        bountyStructs[key].issuer = _issuer;
        bountyStructs[key].fulfillmentAmount = amount;
        bountyStructs[key].balance = msg.value;
        bountyStructs[key].bountyOpen = true;
        
        
        return true;
    }

    function appendFulfillment(bytes32 bountyKey) public payable returns(bool success) {
        require(isBounty(bountyKey));
        Fulfillment memory f;
        f.fulfillmentAmount = msg.value;
        f.fulfiller = msg.sender;
        bountyStructs[bountyKey].fulfillments.push(f);
        
        return true;
    }

}
