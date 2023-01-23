pragma solidity ^0.4.17;


contract TestA02 {

    uint _size;
    mapping(uint => address) private arrayMap;

    constructor() public {
        _size = 0;
    }

    function add(address a) public {
        arrayMap[_size++] = a;
    }

    function get() public view returns(address) {return(arrayMap[0]);}
    function get(uint i) public view returns(address) {return(arrayMap[i]);}

    function getSize() public view returns(uint) {return(_size);}
}
