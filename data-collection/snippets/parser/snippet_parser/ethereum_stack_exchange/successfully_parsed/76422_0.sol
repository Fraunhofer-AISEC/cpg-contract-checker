pragma solidity 0.4.26;

contract Test {
    uint256[] public globalArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    function getPartialArray() public view returns (uint256[] memory) {
        uint256[] memory localArray = clone(globalArray, globalArray.length);
        for (uint256 i = 0; i < localArray.length; i++) {
            uint256 n = i + uint256(keccak256(abi.encodePacked(msg.sender, now))) % (localArray.length - i);
            uint256 temp = localArray[n];
            localArray[n] = localArray[i];
            localArray[i] = temp;
        }
        return clone(localArray, localArray.length / 4);
    }

    function clone(uint256[] memory _array, uint256 _length) private pure returns (uint256[] memory) {
        uint256[] memory array = new uint256[](_length);
        for (uint256 i = 0; i < _length; i++) {
            array[i] = _array[i];
        }
        return array;
    }
}
