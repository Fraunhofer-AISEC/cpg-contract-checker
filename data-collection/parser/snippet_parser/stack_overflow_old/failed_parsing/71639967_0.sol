pragma solidity ^0.6.0;

contract mycontract {
    
    uint[] public uintarray = [1,2,3];
    string[] public stringarray = ["past, present, future"]; 
    string[] public values;

    funtion addvalue(string memory _value) public {
        values.push(_value);
    }
}
