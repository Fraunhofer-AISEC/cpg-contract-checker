
pragma solidity ^0.8.0 ;

contract Simple {
    mapping(string => uint[]) serialID;
    
    function set(string memory _id, uint[] memory _values) public {
        serialID[_id] = _values;
    }

    function get(string memory _id) public view returns(uint[] memory) {
        return serialID[_id];
    } 
}
