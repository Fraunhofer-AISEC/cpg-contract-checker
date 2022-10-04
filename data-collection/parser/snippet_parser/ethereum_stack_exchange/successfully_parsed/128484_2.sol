pragma solidity ^0.8.0;

contract Test {

    struct WithoutReservedSlots {
        bool foo;
        uint bar;
    }

    struct WithReservedSlots {
        bool foo;
        uint bar;
        bytes32[50] _reserved;
    }

    mapping(address => WithReservedSlots) reservedMapping;
    mapping(address => WithoutReservedSlots) notReservedMapping;

    
    function addReservedInPlace() public {
        reservedMapping[msg.sender].foo = true;
        reservedMapping[msg.sender].bar = 0;
    }

    
    function addReservedNotInPlace() public {
        WithReservedSlots memory entry;

        entry.foo = true;
        entry.bar = 0;

        reservedMapping[msg.sender] = entry;
    }

    
    function addNotReserved() public {
        WithoutReservedSlots memory entry;

        entry.foo = true;
        entry.bar = 0;
        
        notReservedMapping[msg.sender] = entry;
    }
}
