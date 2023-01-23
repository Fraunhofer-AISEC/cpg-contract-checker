pragma solidity ^0.4.11;
contract TestArray {
    uint[] public original;
    uint[] public newOr;
    event Log(uint n, uint a, uint b, uint c);

    function TestArray(){
        original.push(1);
        original.push(2);
        original.push(3);
        original.push(4);

    }

    function test(){
        newOr = remove(original, 1);
        Log(newOr.length, newOr[0], newOr[1], newOr[2]);
    }
    function remove(uint[] array, uint index) internal returns(uint[] value) {
        if (index >= array.length) return;

        uint[] memory arrayNew = new uint[](array.length-1);
        for (uint i = 0; i<arrayNew.length; i++){
            if(i != index && i<index){
                arrayNew[i] = array[i];
            } else {
                arrayNew[i] = array[i+1];
            }
        }
        delete array;
        return arrayNew;
    }

}
