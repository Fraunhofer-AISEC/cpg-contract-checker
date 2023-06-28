pragma solidity 0.5.1;

import "./Ownable.sol";
import "./HitchensUnorderedKeySet.sol";

contract Batch is Ownable {

    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;
    HitchensUnorderedKeySetLib.Set batchIds;

    struct BatchStruct {
        
        uint batchCreationDate; 
        address batchOwner;
        string batchOrigin; 
        string productName; 
    }

    mapping(bytes32 => BatchStruct) public batches; 

    function genBatchId() internal view returns(bytes32) {
        return keccak256(abi.encodePacked(address(this), batchIds.count()));
    }

    function createBatch(address batchOwner, string memory batchOrigin, string memory productName) public onlyOwner returns(bytes32) {
        bytes32 id = genBatchId();
        batchIds.insert(id);
        BatchStruct storage b = batches[id];
        b.batchOwner = batchOwner;
        b.batchOrigin = batchOrigin;
        b.productName = productName;
        
    }

    

    function getBatch(bytes32 batchId) public view returns(uint, address, string memory, string memory) {
        require(batchIds.exists(batchId), "Batch not found");
        BatchStruct storage b = batches[batchId];
        return (b.batchCreationDate, b. batchOwner, b.batchOrigin, b.productName);
    }
}
