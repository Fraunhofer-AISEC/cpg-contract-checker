pragma solidity ^0.4.19;

contract test {

event randomNumbers(uint[8] numbers, uint[8] randomNumbers);

function testa() public returns (uint[8] bla) {

    
    uint something = uint(keccak256("rockandroll"));

    uint[8] memory array;
    uint[8] memory random;

    for(uint i=0; i<8; i++) {
        uint digit = something % 10000;
        
        array[i] = digit;
        something /= 10000;
        random[i] =digit % 10;
    }

    randomNumbers(array,random);

    return array;
}
}