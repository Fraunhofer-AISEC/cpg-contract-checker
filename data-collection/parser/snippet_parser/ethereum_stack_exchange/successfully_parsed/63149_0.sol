pragma solidity ^0.5.0;

contract TestNestedStructInMapping {

    
    struct structNested {
        uint dummy;
    }

    
    struct structMain {
        structNested gamePaymentsSummary;
    }

    
    mapping(uint256 => structMain) public s_mapOfNestedStructs;
}
