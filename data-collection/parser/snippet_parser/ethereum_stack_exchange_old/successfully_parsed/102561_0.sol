
pragma solidity >=0.4.22 <0.9.0;

contract Vaccination {
    uint[] public lengths;
    function getSize(uint[] memory arr) public returns(uint){
        lengths.push(arr.length);
        return arr.length;
    }
    
}
