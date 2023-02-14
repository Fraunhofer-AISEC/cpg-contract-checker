pragma solidity ^0.4.24;

contract test {

    uint[] values = [1,2,3,4,5,6];
    uint[] auxArray;

    function removeValueFromArray(uint _num) public returns(uint[]) {

        

        for (uint i = 0; i < values.length; i++){
            if(values[i] != _num)
                auxArray.push(values[i]);
        }

        return auxArray;
    }
}
