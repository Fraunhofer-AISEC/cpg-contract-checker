pragma solidity 0.5.9;

contract Transport {
    struct Batch {
        string creationDate;
        address owner;
        string origin;
        string productName;
    }
    Batch[] public batches;

    function createNewBatch(
        string calldata creationDate,
        address owner,
        string calldata origin,
        string calldata productName
    )
        external
    {
        batches.push(Batch({
            creationDate: creationDate,
            owner: owner,
            origin: origin,
            productName: productName
        }));
    }
}
