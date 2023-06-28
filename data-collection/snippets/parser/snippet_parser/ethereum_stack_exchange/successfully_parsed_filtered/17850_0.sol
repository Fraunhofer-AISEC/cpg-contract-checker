pragma solidity ^0.4.11;
contract TestArray {
    uint[] public original;
    uint[] public newOriginal;

    function TestArray(){
        original.push(2);
        original.push(3);
    }

    function testRemove(){
        newOriginal = remove(original, 0);
    }

    function getLength(uint[] array) constant returns(uint number){
        return array.length;
    }

    function remove(uint[] array, uint index) internal returns(uint[] value) {
        if (index >= array.length) return;

        uint[] arrayNew;
        for (uint i = index; i<array.length-1; i++){
            arrayNew[i] = array[i+1];
        }
        delete array;
        return arrayNew;
    }
}
