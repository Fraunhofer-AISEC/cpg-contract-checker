
pragma solidity ^0.8.3;

contract Test03 {
    address public owner;
    int32 public id;

    event ContractCreated();

    constructor() {
        owner = msg.sender;

        emit ContractCreated();
    }

    function doSmth(int32 _id) public {
        require(id != 0, "id is zero");
        id= _id;
    }
}
