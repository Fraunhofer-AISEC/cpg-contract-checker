
pragma solidity ^0.8.17;

contract Test {

    mapping(address => address[]) public addressList;

    function addAddress(address _user) external {
        address result;
        
        assembly {

            
            
            
            
            mstore(0x00, _user)
            mstore(0x20, 0)
            let arraySlot := keccak256(0x00, 0x40)

            
            result := create(0, 0x00, 0x00)

            
            let arraySize := sload(arraySlot)


            
            
            mstore(0x00, arraySlot)
            let dataSlot := keccak256(0x00, 0x20)

            sstore(add(dataSlot, arraySize), result)

            
            sstore(arraySlot, add(arraySize, 1))

        }
    }
}
