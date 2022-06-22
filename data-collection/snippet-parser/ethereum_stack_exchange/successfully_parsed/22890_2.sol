pragma solidity ^0.4.9;

contract Test {

    address da;

    function Test() public {
        da = msg.sender;
    }

    function getSender () public view returns (address){
        return da;
    }
}
