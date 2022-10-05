pragma solidity ^0.4.11;

contract MetaCoin {
    event PlaySlotEvent(
        uint value,
        address owner
    );

    function playSlot() public returns (uint){
        uint r = (block.timestamp + uint(block.blockhash(block.number-1)))%100 + 1;
        PlaySlotEvent(r,msg.sender);
    }
}

contract Test {

    function getCurrentR() constant returns (uint) {
        return (block.timestamp + uint(block.blockhash(block.number-1)))%100 + 1;
    }
}
