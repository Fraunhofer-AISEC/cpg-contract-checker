pragma solidity ^0.4.9;

library BasicLib {
    function add(uint into, uint val) returns(uint) {
        return into + val;
    }
}


contract Basic {
    uint public data;

    function increase() {
        data = BasicLib.add(data, 10);
    }    
}
