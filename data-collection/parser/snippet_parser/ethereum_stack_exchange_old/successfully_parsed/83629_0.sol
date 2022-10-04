pragma solidity ^0.4.24;
contract test{
    uint[] public array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
    function removewithgap(uint index)  returns(uint[]) {
        if (index >= array.length) return;
        delete array[index];
        return array;
    }
    function removewithoutgap(uint index)  returns(uint[]) {
        if (index >= array.length) return;

        for (uint i = index; i<array.length-1; i++){
            array[i] = array[i+1];
        }
        delete array[array.length-1];
        array.length--;
        return array;
    }
}
