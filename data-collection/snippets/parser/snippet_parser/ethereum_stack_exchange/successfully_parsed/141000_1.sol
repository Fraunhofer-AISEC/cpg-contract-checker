

pragma solidity 0.8.3;  

contract ReadArrayStorage {

    uint[] newArray = [1,2,3,4];

     
    function updateArray(uint[] calldata recievedArray)public {
            newArray = recievedArray;
    }

    function readArray() public view returns (uint[] memory) {
        return newArray;

    }

    function deleteNewArray() public {
        delete newArray;
    }


    
    function updateSlot(uint256 slotNumber, uint256 newValue) public {

        assembly {
            sstore(slotNumber, newValue)
        }
    }

    function readSlot(uint slotNumber) public view returns (uint value) {
        assembly{
            value := sload(slotNumber)
        }

    }

    
    function arrLocation(uint256 slot, uint256 index, uint256 elementSize) public pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(slot))) + (index * elementSize/256) ;
    }



}
