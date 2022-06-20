pragma solidity ^0.5.0;

contract Base {

bytes32 internal constant IMPLEMENTATION_SLOT = 0x7050c9e0f4ca769c69bd3a8ef740bc37934f8e2c036e5a723fd8ee048ed3f8c3;


function _setImplementation(address newImplementation) public {
   bytes32 slot = IMPLEMENTATION_SLOT;

   assembly {
     sstore(slot, newImplementation)
   }
}

function _implementation() public view returns (address impl) {
   bytes32 slot = IMPLEMENTATION_SLOT;
   assembly {
     impl := sload(slot)
   }
}

function getSlot() public view returns(bytes32) {
    return IMPLEMENTATION_SLOT;
}
}
