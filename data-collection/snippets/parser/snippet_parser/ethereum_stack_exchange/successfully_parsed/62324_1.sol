pragma solidity ^0.4.21;

contract test2 {

    bytes32 public _id;

    event LogTestCase(
        bytes32 _id
    );

    function setID(bytes32 cId) returns (bool){
        _id = cId;
        emit LogTestCase(_id);
        return true;
    }
}
