

pragma solidity 0.8.3;  

contract ReadArrayStorage {

    uint[] newArray = [5,6,7];

     
    function updateArray(uint[] calldata recievedArray)public {
            newArray = recievedArray;
    }

    function readArray() public view returns (uint[] memory) {
        return newArray;

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


}
