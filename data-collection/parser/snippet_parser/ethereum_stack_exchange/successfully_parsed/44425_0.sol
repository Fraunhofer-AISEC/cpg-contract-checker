   pragma solidity ^0.4.18;


contract HashedTimelock {


        address sender = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c;
        address receiver = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
        bytes32 hashlock = 0x731dc163f73d31d8c68f9917ce4ff967753939f70432973c04fd2c2a48148607; 
        uint  timelock = 1522660821; 

   function HashedTimelock() payable{}


    function withdraw(bytes32 _preimage)
        external returns(bytes32 sample)
    {
        uint  timenow = now;
        assembly {
            
            
            
            if eq(1,lt(timenow, sload(timelock_slot))){
               let selfptr := mload(add(_preimage, 0x20))
               sample := keccak256(selfptr, 32)

            }
        }

    }



}
