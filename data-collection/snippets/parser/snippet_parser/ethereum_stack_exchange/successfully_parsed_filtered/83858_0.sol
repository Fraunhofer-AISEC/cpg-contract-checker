pragma solidity ^0.6.8;


contract Test {

    uint256[] public array = [0,1,2];

    function A(uint256 input )public {
            array.push(input);
            
    }

    function B(uint256 input )public {
            array.push(input);
            
    }
}
