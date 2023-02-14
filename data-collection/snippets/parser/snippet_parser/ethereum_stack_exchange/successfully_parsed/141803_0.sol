pragma solidity ^0.8.0 ;

contract Simple {
    mapping(string => uint)  serialID;
    
    function set(string memory _id ,uint value_a ,uint value_b ,uint value_c ,uint value_d) public {
        serialID[_id] = value_a;
        serialID[_id] = value_b;
        serialID[_id] = value_c;
        serialID[_id] = value_d;
    }

    function get(string memory _id) public view returns(uint) {
        return serialID[_id];
    } 
}
