pragma solidity ^0.4.13;

contract Bytes32Test {

    bytes32 msg;

    function add(bytes32 _msg){
        msg = _msg;
    }

    function show() constant returns (bytes32){
        return msg;
    }

}
