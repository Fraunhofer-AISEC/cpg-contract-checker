pragma solidity ^0.4.18;

contract C {

    
    uint[][] data;

    function append(uint _a, uint _b) public {
        data.push([_a, _b]);
    }

    function read(uint _idx) public view returns (uint[]) {
        return data[_idx];
    }
}
