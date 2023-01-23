
pragma solidity ^0.4.21;

contract SaveData {
    uint a;
    function getA () public view returns (uint _a){
        return a;     
    }
    function setA (uint _a) public{
        a = _a;     
    }
}
