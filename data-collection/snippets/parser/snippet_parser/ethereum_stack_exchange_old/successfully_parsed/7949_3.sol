pragma solidity ^0.4.8;

contract Test {

    address public constant MY_ADDRESS = msg.sender;

    function check() constant returns (address) {
        return MY_ADDRESS;
    }
}
