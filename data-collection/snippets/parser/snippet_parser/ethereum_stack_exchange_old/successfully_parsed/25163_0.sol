pragma solidity ^0.4.11;



contract List {

    struct ListMembers {
        bytes32 listOwner;
        bytes32[] members;
        uint256 rNumber;
        uint256 aNumber; 
        uint256 uNumber;  
    }

    ListMembers public lm;
    mapping (bytes32 => bool) public addedMembers;

    function List(bytes32 listOwner) {
        lm.listOwner = listOwner;
        lm.rNumber = 10000;
        lm.aNumber = 0;
        lm.uNumber = 0;
    }
}
