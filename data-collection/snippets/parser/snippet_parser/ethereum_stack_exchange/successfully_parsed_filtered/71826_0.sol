pragma solidity ^0.4.23;
contract Transport {

    address public manager;
    Batch[] public batchArray;
    mapping(uint => bool) batchList;

    struct Batch {
        uint batchId;
        string batchCreationDate;
        address batchOwner;
        string batchOrigin;
        string productName;
    }
    constructor(address owner) public {
        manager = owner;
    }
    function createNewBatch(string batchCreationDate, address batchOwner, 
                         string batchOrigin, string productName) public { 

        uint batchId = uint(keccak256(block.difficulty, now));

        Batch memory newBatch = Batch ({
            batchId: batchId,
            batchCreationDate: batchCreationDate,
            batchOwner: batchOwner, 
            batchOrigin: batchOrigin,
            productName: productName
        });

        batchArray.push(newBatch);
        batchList[batchId] == true;
    }

    function getBatchDetails(uint batchId) public view returns(string, address, string, string) {
       
    }
}    
