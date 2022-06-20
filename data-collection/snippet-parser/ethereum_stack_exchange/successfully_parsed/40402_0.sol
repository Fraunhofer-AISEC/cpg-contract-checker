pragma solidity ^0.4.20;


import "./StandardToken.sol";

contract Callee {

    address public caller_;

    function setCaller() public {
        caller_ = msg.sender;
    }
}

contract DirectCaller is Callee, StandardToken {

}

contract IndirectCaller {

    function call() public {
        
        Callee(0xb87213121fb89cbd8b877cb1bb3ff84dd2869cfa).setCaller();
    } 
}
