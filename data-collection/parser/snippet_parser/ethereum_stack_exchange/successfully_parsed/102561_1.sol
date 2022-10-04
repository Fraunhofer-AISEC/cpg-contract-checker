pragma solidity >=0.4.22 <0.9.0;

contract Test {
    function getSize(uint[] memory arr) public pure returns(uint){
        return arr.length;
    }
    
}
