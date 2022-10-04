uint256 n = 0;
bytes32[n] example;

function getArraySize(uint256 arraySize) public returns(uint256 size) {

 size = arraySize;
 return size;

}

n = getArraySize(3);
example[n] = [bytes32("value_1"),bytes32("value_2"),bytes32("value_3")];
