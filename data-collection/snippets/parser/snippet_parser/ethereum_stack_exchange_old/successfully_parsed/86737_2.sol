pragma solidity 0.5.0;

contract TestStorage {
    byte[] b;

    constructor () public {
        uint8 i;
        for (i = 1 ; i <= 32; i++) {
            b.push(byte(i));
        }
    
        for (i = 1 ; i <= 32; i++) {
            b.push(byte(i));
        }
    }

    function readFromStorage() public view returns(bytes32 slot1, bytes32 slot2, bytes32 slot3) {
        bytes memory slot = new bytes(32);
        assembly {
            mstore(
                add(slot, 32),
                b_slot
            )
        
            let slotHash := keccak256(add(slot, 32), 32)
            slot1 := sload(
                add(
                    slotHash,
                    0
                )
            )
        
            slot2 := sload(
                add(
                    slotHash,
                    1
                )
            )
        
            slot3 := sload(
                add(
                    slotHash,
                    2
                )
            )
        
        }

    }
}
