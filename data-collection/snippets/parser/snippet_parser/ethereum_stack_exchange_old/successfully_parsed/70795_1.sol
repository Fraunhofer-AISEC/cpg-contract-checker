pragma solidity ^0.5.2;

library ChangeableLib
{

    function write(uint[] storage x, uint y) internal {
        x.push(y);
    }

    function read(uint[] storage x) internal view returns(uint sum) {
        for(uint i=0; i<x.length; i++) {
            sum += x[i];
        }
    }
}

contract Test {

    using ChangeableLib for uint[];

    uint[] public numbers;

    function push(uint y) public {
        numbers.push(y); 
    }

    function adder() public view returns(uint) {
        
        return numbers.read(); 
   }
}
